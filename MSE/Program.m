clc;
clear all;
close all;
im1 = imread('earth.ppm');
im2 = imread('l.ppm');
err = immse(im2, im1);
fprintf('The mean-squared error is %0.4f.\n', err);