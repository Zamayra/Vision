%% TP3 Hough Transforms
% Zamayra Hernandez & Kosma Przyjemski

%% I. Modeling of line segments
% Image binarisation
image = imread('image.jpg');
%colormap(gray(256));

binary_image = im2bw(image, 0.3);
% why should we consider using gradient estimator?