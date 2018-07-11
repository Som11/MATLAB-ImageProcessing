%% Read Image
InputImage=imread('example.jpg');
%% Show image
figure(1)
imshow(InputImage);
title('INPUT IMAGE WITH NOISE')
%% Convert to gray scale
if size(InputImage,3)==3 % RGB image
 InputImage=rgb2gray(InputImage);
end
%% Convert to binary image
threshold = graythresh(InputImage);
InputImage =~im2bw(InputImage,threshold);
%% Remove all object containing fewer than 30 pixels
InputImage = bwareaopen(InputImage,30);
pause(1);
%% Label connected components
[L Ne]=bwlabel(InputImage);
propied=regionprops(L,'BoundingBox');
imshow(~InputImage);
hold on
for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (1);
%% Objects extraction
figure
for n=1:Ne
  [r,c] = find(L==n);
  n1=InputImage(min(r):max(r),min(c):max(c));
  imshow(~n1);
  pause(0.5)
end
