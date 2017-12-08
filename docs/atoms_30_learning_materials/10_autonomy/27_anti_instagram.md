# Anti-Instagram

* We would like to improve the performance of our line detector in terms of illumination invariance.
* We do this by computing a color filter when needed, and then apply it.
* Some ideal colors for the floor tile (black), and the lane lines (white, yellow and red) are defined.
* K-means clustering is performed on the image pixels. The clusters are then compared to black, white and yellow.
* The linear color transformation is fitted using least squares to shift the clusters centers towards what they should ideally be.

## Data Preprocessing

* Ultimately, this serves to improve the line detector results.
* Only need to consider lane elements, e.g. yellow dashes, red stop lines, etc.
* So we want to remove the extra and misleading information (which slows and confuses k-means) before applying K-means.

### Lane Surface Identification

* Prior knowledge:
    * Assumption: Bottom ⅖ is lane, top ⅓ is not lane.
    * Pixels within a lane element have low gradient.
    * Pixels crossing boundaries, i.e. line edges, have high gradient.
* Detailed steps:
    1. Compute gradient
    
        Compute the image gradient with Sobel operator. The result turns out to be better when done in RGB rather than HSV space.
        
        <img src="27_anti_instagram/grad.png" style="width: 400px"/>
    2. Threshold gradient
        
        This makes a binary image out of the gradient.
        
        <img src="27_anti_instagram/grad_th.png" style="width: 400px"/>
    3. Dilate gradient
        
        This continues broken lines in the gradient, due to noise (e.g. from motion blur).
        
        <img src="27_anti_instagram/grad_th_dilated.png" style="width: 400px"/>
    4. Zero fill bottom ⅖
        
        This part is assumed to be lane surface. See next step for explanation.

        <img src="27_anti_instagram/grad_th_dilated_zeroed.png" style="width: 400px"/>
    5. Floodfill to get mask
        
        This yield the single connected component of low gradient part. The seed is chosen from the bottom ⅖.

        <img src="27_anti_instagram/ff.png" style="width: 400px"/>
    6. Close narrow openings
        
        Regions inside narrow openings are probably high gradient part within the lane, and thus should be kept. We close it first, which is equivalent to dilation followed by errosion.

        <img src="27_anti_instagram/ff_closed.png" style="width: 400px"/>
    7. Fill the holes
        
        Then fill the resulting holes by floodfilling from the top, and take the complement.
        
        <img src="27_anti_instagram/ff_closed_ff.png" style="width: 400px"/>
    8. Clip off top ⅓
        
        This part are assumed to be not lane surface, so it gets clipped off from the mask.

        <img src="27_anti_instagram/ff_closed_ff_clipped.png" style="width: 400px"/>

### Boundary Region Detection

* Intuitions:
    * We observed that regions of boundaries between lane lines already contain sufficient color information.
    * Restricting to boundary areas will further remove irrelevant parts while substantially accelerating k-means computation.
* Detailed steps:
    1. Compute, threshold and dilate gradient
        
        High gradient part corresponds to boundaries. Dilation is meant to cover more of the bordering pixels to get sufficient information.

        <img src="27_anti_instagram/grad_cnt.png" style="width: 400px"/>
    2. Find contours as masks
        
        We want to capture the boundary areas, which can be found as contours in the gradient map above.
        
        <img src="27_anti_instagram/grad_cnt_masked.png" style="width: 400px"/>
    3. Remove small contours and fill in 
        
        Contours that have small size are probably noise. Fill in the holes turn out to provide more information than noise.

        <img src="27_anti_instagram/grad_cnt_masked_th.png" style="width: 400px"/>
        
        The pixels under this mask then get fed into the k-means algorithm.

## K-Means Clustering
    
TODO: by Christoph

## Fitting Color Transform with Least Squares

TODO: by Milan
