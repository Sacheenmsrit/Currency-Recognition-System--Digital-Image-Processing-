function fet=totalfeature(rgbim)
 %color feature
 fet1=color_luv(rgbim);
 %edge feature
 fet2=edgehist(rgbim);
 %texture feature
 %glcm-gray level co occurrence matrix
 glcm=graycomatrix(rgb2gray(rgbim));
 fet3=glcm(:);
 fet=[fet1;fet2;fet3];