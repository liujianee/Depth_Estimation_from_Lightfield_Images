
clear all
close all
clc
% access disparity data
c  = cd('.\data');
load('Dispunit_Net7_52fc'); % load the output of proposed network.
Disp_out = Mean_unit_Net;
y0 = im2double(imread('7Kitchen.png')); % read the central view image
[rows cols] = size(Disp_out);
cd(c);
w       = 5;        % bilateral filter half-width
sigma   = [10 0.1]; % bilateral filter standard deviations
im=bfilter2(y0,w,sigma);
im_edge0 = edge(im(:,:,1), 'canny') | edge(im(:,:,2), 'canny') | edge(im(:,:,3), 'canny');
im_edge1 = imdilate(im_edge0, strel('disk', 2));   
im_edge2 = imdilate(im_edge0, strel('disk', 2)); 
% total number of pixels
n  = rows*cols;
% sampling ratio
sp = 0.2;
disp('--- Running Demonstration for Dense Disparity Estimation ---');
S_pilot =im_edge1;
b       = S_pilot.*Disp_out;
xout_pilot  = ADMM_outer(S_pilot,b);
figure; imagesc(xout_pilot); axis equal; colorbar;
S =im_edge2;
b = S.*xout_pilot;
xout = ADMM_outer(S,b);
figure; imagesc(xout); axis equal; colorbar;
 
%% denoise
depth = xout;
color = y0;
sigma = 10/255;
final = denoise(color, depth, sigma^2, 30, 7, 1.0);
figure; imagesc(final); axis equal; colorbar;

%% RMSE and MAE  

load('7'); %load raw LF data (.mat format)
A=Mean_img;
Amin=min(min(A));
Amax=max(max(A));


unit=(Amax-Amin)/1000;

output=final;

dis_new=zeros(434,625);

for i=1:434
       for j=1:625
         dis_new(i,j)=round(output(i,j)/0.001)*unit+Amin; 
       end
end
figure; imagesc(dis_new); axis equal; colorbar;
RMSE=sqrt(sum(sum(((dis_new-LF.disp_lowres).^2)))/(512*512));
MAE=mae(abs(dis_new-LF.disp_lowres));
 
 
 
 
