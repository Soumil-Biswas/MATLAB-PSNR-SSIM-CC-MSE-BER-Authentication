clc;
clear all;
close all;
im1 = imread('earth.ppm');
im2 = imread('l.ppm');
[ssimval, ssimmap] = ssim(im2,im1);
fprintf('The SSIM value is %0.4f.\n',ssimval);