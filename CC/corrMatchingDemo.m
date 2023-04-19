clc;
clear all;
close all;

%% Prepare the image for analysis
F = imread('map2.ppm'); % read in coins image
T = imread('l.ppm'); % read in template image
%% display frame and template
figure, subplot(121),imshow(F),title('First Image');
subplot(122),imshow(T),title('Second Image');
%% correlation matching
[corrScore, boundingBox] = corrMatching(F,T);