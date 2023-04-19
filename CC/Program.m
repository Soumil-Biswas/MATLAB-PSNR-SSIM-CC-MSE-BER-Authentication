clc;
clear all;
close all;

im1 = rgb2gray(imread('map2.ppm'));
im2 = rgb2gray(imread('l.ppm'));
c = normxcorr2(im1,im2);
maxval = max(c(:));

fprintf('The NCC value is %0.4f.\n', maxval);