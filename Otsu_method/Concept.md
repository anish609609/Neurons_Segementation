# Otsu Thresholding — Concept and Implementation

## Overview
Otsu’s method is an automatic image thresholding technique that separates an image into foreground and background by maximizing the distinction between the two classes.

It selects the threshold that maximizes the between-class variance.

---

## How Otsu Method Works

1. Compute the histogram of image intensities  
2. Iterate through all possible threshold values T  
3. For each threshold:
   - Divide pixels into:
     - Background (intensity ≤ T)
     - Foreground (intensity > T)
   - Compute:
     - Class probabilities: w0, w1  
     - Class means: mu0, mu1  

4. Compute between-class variance:

   sigma_b^2 = w0 * w1 * (mu0 - mu1)^2

5. Select the threshold that maximizes sigma_b^2

---

## Example (3×3 Image)

Given image:

[ 10   12   15  
  200  210  220  
  205  215  225 ]

### Threshold Selection

Try T = 180

- Background: [10, 12, 15]
- Foreground: [200, 205, 210, 215, 220, 225]

Compute:
- mu0 ≈ 12.3  
- mu1 ≈ 212.5  

This produces a large separation between classes, resulting in a high between-class variance.

---

## Advantages

- Fully automatic (no manual tuning)  
- Fast and computationally efficient  
- Works well for bimodal histograms  

---

## Limitations

- Uses only intensity (no spatial information)  
- Fails when:
  - Noise is high  
  - Intensities overlap  
  - Structures are thin (e.g., neurons)  

### Common Issues

- Broken structures  
- False segmentation  
- Loss of connectivity  

---

## Key Insight

Otsu is a global intensity-based method and does not consider spatial relationships.