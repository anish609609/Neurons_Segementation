
% ------------------------------------------------------------
% IMAGE SEGMENTATION USING OTSU METHOD (WITH COMPARISON)
%
% PIPELINE:
% 1. Read input color image
% 2. Convert RGB -> Grayscale
% 3. Compute Otsu threshold automatically
% 4. Apply Otsu threshold to get binary image
% 5. Apply manual thresholds (low and high) for comparison
% 6. Display all results for analysis
% ------------------------------------------------------------

clc;
clear;
close all;

% Step 1: Read input image (use any image you want)
img = imread('peppers.png');  % built-in MATLAB image

% Step 2: Convert to grayscale
gray_img = rgb2gray(img);

% Step 3: Compute Otsu threshold
otsu_thresh = graythresh(gray_img);  % returns value in [0,1]

% Step 4: Apply Otsu threshold
bw_otsu = imbinarize(gray_img, otsu_thresh);

% Step 5: Manual thresholds for comparison
manual_thresh_low  = 0.3;
manual_thresh_high = 0.7;

bw_low  = imbinarize(gray_img, manual_thresh_low);
bw_high = imbinarize(gray_img, manual_thresh_high);

% Convert threshold to 0–255 scale for understanding
otsu_thresh_255 = otsu_thresh * 255;

% Display threshold values
fprintf('Otsu Threshold (0-1 scale): %.4f\n', otsu_thresh);
fprintf('Otsu Threshold (0-255 scale): %.2f\n', otsu_thresh_255);

% Step 6: Display results
figure;

subplot(2,3,1);
imshow(img);
title('Original Color Image');

subplot(2,3,2);
imshow(gray_img);
title('Grayscale Image');

subplot(2,3,3);
imshow(bw_otsu);
title(['Otsu Threshold = ', num2str(otsu_thresh, '%.2f')]);

subplot(2,3,4);
imshow(bw_low);
title('Manual Threshold = 0.3');

subplot(2,3,5);
imshow(bw_high);
title('Manual Threshold = 0.7');

subplot(2,3,6);
imhist(gray_img);
title('Histogram (Grayscale)');

