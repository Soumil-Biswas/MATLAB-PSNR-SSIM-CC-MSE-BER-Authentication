clc;
clear all;
close all;

im1 = rgb2gray(imread('map2.ppm'));
im2 = rgb2gray(imread('l.ppm'));
c = corr2(im1,im2);
fprintf('The NCC value is %0.4f.\n', c);