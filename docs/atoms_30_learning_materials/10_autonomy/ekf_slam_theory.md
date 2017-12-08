# Extended Kalman Filter SLAM: Algorithmic Foundations 

## A High-Level Explanation

The general idea behind EKF SLAM is that we are presented with a map that has a number of discrete features, and we have to use estimates of the robots movement and the relative position of the landmarks to get a picture of the map with uncertainty. We use the Kalman filter under the assumption that the noise involved in the measurements is Gaussian, and the importance of Gaussian-ness limits us to inference from the presence of landmarks rather than their absence, since the latter tends to induce non-Gaussian beliefs. We initialize a state vector that has the position of the robot in the map coordinate frame. The state vector will also include the coordinates of the different landmarks. As the robot moves, we get noisy estimates of its new position (see the predict step). We can decompose the motion of the robot into a noise-free n and a component of random Gaussian noise with mean 0. The noise-free component is what we call the “motion function”. During that step, we have to linearize the motion model, which we do by finding the Jacobian of the  motion function and estimating it with a first order Taylor approximation. This is what allows the EKF to linearize the motion of the robot, which in turn is what allows for localization.

In addition to the changes in position, we also have to update the entries for the landmarks. When the robot encounters a new landmark, it has to augment its state vector with the estimate of the position of the landmark relative to the estimated robot position which, since the robot was initialized to be at the origin, gives an estimated position in the map coordinates (see the augment step). In the context of EKF, this means we need a linearized measurement model that has Gaussian noise, similar to how we linearized the process model. To do this, we need the values for the distance and angle between the robot and the landmark. Finding these is not too difficult, and we can get the distance using the Euclidean distance and the angle using the arctangent, where the inputs are the x and y values for the relative distance of the landmark to the robot.  The vector of this distance and angle gives the measurement model, of which we can find the Jacobian in order to linearize the model as we did with the process model using a Taylor Approximation (see the update step).

In the predict step, we use the process model to model the change in position of the robot over time. We use the mean of the 𝛳 parameter to change the position in the x and y directions as the velocity times the cosine or sine of theta (depending on if it is in the x or y direction), to get the “component” of velocity in either direction, multiplied by the change in time. Then we look at the linearized error of the model, which involves the derivative (Jacobian matrix) of the motion function that we just used. Finally, we add Gaussian noise and update the covariance matrix using the Jacobian matrix that we found before. 

## Our Implementation

### Predict Step

    def predict(self, w , v, dt):
        """Predicts robot pose given angular velocity, velocity, and time.
        See Probablistic Robotics Chapter 10 for maths.
        """
        # See Probablistic robots table 10.1 line 3 (modified for out model)
        th = self.mean[2]
        bot_pose_change = np.array([v * np.cos(th), v * np.sin(th), w]) * dt
        self.mean[0:3] += bot_pose_change
        self.mean[2] %= 2*np.pi

        # Linearized error of process model
        G = np.identity(2 * self.N + 3)
        G[0,2] = -v * np.sin(th) * dt
        G[1,2] =  v * np.cos(th) * dt
        G[2,2] = w * dt

        # Add Gaussian noise to Robot pose
        R = np.zeros((2 * self.N + 3, 2 * self.N + 3))
        R[0:3,0:3] = self.R

        # Update uncertainty
        self.cov = G.dot(self.cov).dot(G.transpose()) + R * dt


The update step occurs when the robot encounters a landmark. We first find the difference between the robot x,y and the landmark x,y, and then use those differences to produce the measurement model as discussed above. Once we get the “z” vector, which corresponds to the measurement model, we find the Jacobian of the measurement model so that we can use it to update covariances and for linearization. We then compute the Kalman gain using the Jacobian and its transpose along with the noise Q. The final step is to update the the x, y and 𝛳 values given the Kalman gain, and make sure that the 𝛳 value is within the range 0 to 2𝜋.

### Update Step

    def single_update(self, r, phi, featureID):
        """Updates mean and covariance given this observation."""
        j = self.features[featureID]
        delta = self.featureMean(j) - self.mean[0:2]
        dx, dy = delta
        q = delta.dot(delta)
        rq = np.sqrt(q)
        # Innovation
        z = np.array([float(r), phi])
        zhat = np.array([rq, np.arctan2(dy, dx) - self.mean[2]])
        # Filter to expand the jacobian to the Cov mtx
        Fxj = np.zeros((5, 3 + 2 * self.N))
        Fxj[:3, :3] = np.identity(3)
        Fxj[3:5, 2*j+3: 2*j+5] = np.identity(2)
        # Jacobian of measurement model
        H = (np.array(
              [[-rq * dx, -rq * dy, 0 , rq * dx, rq * dy],
               [ dy     , -dx     , -q, -dy    , dx     ]]) / q
            ).dot(Fxj)
        HT = H.transpose()
        # Kalman gain
        K = self.cov.dot(HT).dot(np.linalg.inv(H.dot(self.cov).dot(HT) + self.Q))
        # Deal with radian wrap around
        zz = z - zhat
        if zz[1] > np.pi / 2: 
        zz[1] = zz[1] - 2*np.pi
        # Update
        self.mean += K.dot(zz)
        self.mean[2] %= 2*np.pi
        self.cov = (np.identity(self.mean.size) - K.dot(H)).dot(self.cov)

The augment step occurs when we see a new landmark. We have to augment the existing state vector with the values of the new landmark. First, we change the x, y, and 𝛳 values of the landmark given the x, y, and 𝛳 values of the robot and the measurements. Then we have to consider how the error in our estimate of the robots position affect our measurements of the landmark’s position. Finally, we update and extend the covariance matrix to include the new landmark, whose measurements will be correlated to the measurements of all the previous landmarks, and we add the ID of the landmark to the collection of IDs we have already seen.

    def augment(self, r, phi, featureID):
        """Augment mean and covariance matrix with the new landmark."""
        ux, uy, th = self.mean[0:3]
        lx = ux + r * np.cos(th + phi)
        ly = uy + r * np.sin(th + phi)
        self.mean = np.append(self.mean,[lx, ly])
        # U is the linearized function that propagates state error to new landmark
        U = np.zeros((2, 3 + self.N * 2))
        U[0:2,0:2] = np.identity(2)
        U[0,2] = r * -np.sin(th + phi)
        U[1,2] = r *  np.cos(th + phi)
        UT = U.transpose()
        # Extend covariance matrix
        self.cov = np.vstack([
          np.hstack([ self.cov       , self.cov.dot(UT)                 ]),
          np.hstack([ U.dot(self.cov), U.dot(self.cov).dot(UT) + self.S ])])
        # Add to feature list
        self.features[featureID] = self.N
        self.N += 1