clc;
clear all;
close all;
im1 = imread('earth.ppm');
im2 = imread('l.ppm');
[peaksnr, snr] = psnr(im2, im1);
fprintf('The Peak-SNR value is %0.4f.\n', peaksnr);