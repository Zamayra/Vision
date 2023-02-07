%TP2
%% Question 1
%match('elon2.pgm','elon3.pgm');
%match('tour1.pgm','tour2.pgm');
%match('tour1.pgm','tour3.pgm');


%% Question 2 - Moravec
image = imread('moravec1_original.png');
filter = ones(11,11);


[ret1_im,ret2_im] = moravec(image);

%% moravec
image = imread('moravec1_original.png');
moravecRes = moravecOK2(image)

%% moravec3
image = imread('moravec1_original.png');
%keypoints = moravec3(image, 0.1, 11, 5);

points = moravec3( image, 31, 20);
