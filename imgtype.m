function imgr = imgtype(img)
%IMGTYPE Summary of this function goes here
%   Detailed explanation goes here
if size(img,3)==3
    imgr = rgb2gray(img);
else
    imgr = img;
end

