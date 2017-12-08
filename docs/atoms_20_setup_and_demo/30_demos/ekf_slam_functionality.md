# Single Slam Project Functionality

For our final project, we are submitting an implementation of the Extended Kalman Filter SLAM algorithm, contained in the file slam.py, and an accompanying series of test cases in test_slam.py. Our github respository can be accessed [here](github.com/CasperN/slam)

We have simulated the change in the agent’s uncertainty overtime using a matplotlib visualization. slam.py includes the following function to visualize the positions and corresponding three sigma matrices of the agent and each of the landmarks as it traverses through space:

    def show(self, sigma=3):
      """Returns a 3 sigma visualization about every point."""

      fig, ax = plt.subplots(figsize=(5, 5))

      # Plot robot position
      plotCovariance(ax,
        self.mean[0:2],
        self.cov[0:2, 0:2],
        sigma, 'b','bot', self.mean[2])

      # Plot map features
      for tag in self.features:
        i = self.features[tag]
        plotCovariance(ax,
          self.featureMean(i),
          self.featureCov(i),
          sigma, 'r', str(tag))

      plt.xlim((-5,5))
      plt.ylim((-5,5))

      plt.show()

      buf = io.BytesIO()
      plt.savefig(buf, format='png')
      buf.seek(0)
      plt.close()
      return buf

We have included several tests, representing each of the following trajectories:
Straight line with landmarks
Go in a circle
Go in an arc, see a landmark
Square with 1 landmark
Square with 4 landmarks
Square with 2 landmarks
Square with 4 landmarks

Each provided test is defined as show below:

    def test_path1():
      """Straight line with landmarks."""
      path = []
      path.append((0,0,1))
      path.append([('A',4,0)])
      path.append((0,1,1))
      path.append([('A',3,0)])
      path.append((0,1,1))
      path.append([('A',2,0)])
      path.append((0,1,1))
      path.append([('A',1,0)])

      execute_path(path, True)

The angular velocity, velocity, and change in time of each observation is appended to the path in the form of the tuple (w, v, dt). The agent’s landmark detections at any given point in time are appended to the path in the form of a list of tuples, with each feature represented by its identifier, x-coordinate, and y-coordinate. 
 
After successfully implementing the algorithm, we shifted our focus to determining ways in which we could incorporate data collected from traversing Duckietown into our EKF SLAM model. One of the approaches we attempted was to log the output of the apriltags node in a rosbag and feed this collection of measurements with their associated timestamps to our update function. The robot_name/tag_detection rostopic produces the following object of type AprilTagDetectionArray:

    detections: 
      id: 97
      size: 0.065
      pose: 
        header: 
          seq: 368
          stamp: 
            secs: 1512693621
            nsecs: 363975048
          frame_id: chuckie/camera_optical_frame
        pose: 
          position: 
            x: -0.06688279189
            y: -0.0358206775667
            z: 0.197207326983
          orientation: 
            x: 0.92983629575
            y: -0.00263710975527
            z: -0.346436235138
            w: -0.124013885277

However, our ability to translate our work to the Duckietown environment remains largely limited by our lack of visual odometry information. There are several ways in which students have currently attempted to estimate the velocity and angular velocity of the robot, by using the robot’s voltage input information for example. If the Duckietown project is successfully able to capture the pertinent visual odometry information in the future, then the integration of our EKF SLAM implementation within a rosnode should be a relatively straightforward process. 
