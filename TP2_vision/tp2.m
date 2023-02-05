%TP2

% Question 1
%match('elon2.pgm','elon3.pgm');
%match('tour1.pgm','tour2.pgm');
%match('tour1.pgm','tour3.pgm');


% Question 2 - Moravec
image = imread('moravec1_original.png');
filter = ones(11,11);


[ret1_im,ret2_im] = moravec(image);