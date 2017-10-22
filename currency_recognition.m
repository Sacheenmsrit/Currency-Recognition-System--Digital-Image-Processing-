% % Program for Currency recognition

% Author        : Arun Kumar
% Email         : mail.drgkumar@gmail.com
% Version       : 1.0
% Date          :7/4/2014

%% clear workspace and command window
clear;clc;
%% read image
[imname,impath]=uigetfile({'*.jpg;*.png'});
im=imread([impath,'/',imname]);
%preprocessing
%resize image
im=imresize(im,[128 128]);
%remove noise;
%seperate channels
 r_channel=im(:,:,1);
 b_channel=im(:,:,2);
 g_channel=im(:,:,3);
 %denoise each channel
 r_channel=medfilt2(r_channel);
 g_channel=medfilt2(g_channel);
 b_channel=medfilt2(b_channel);
 %restore channels
 rgbim(:,:,1)=r_channel;
 rgbim(:,:,2)=g_channel;
 rgbim(:,:,3)=b_channel;
 %featureextraction
fet=totalfeature(rgbim);
load db;
k=length(currency);
for j=1:k
    D(j)=dist(fet',currency(j).feature);
end
[value,index]=min(D);
if value<.001
   currency_name=currency(index).name;
   fprintf('recognized currency is : ');
   disp(currency_name)
else
    disp('no matches found');
end
 
    
