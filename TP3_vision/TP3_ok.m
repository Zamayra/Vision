% TP3 Hough Transforms
% Zamayra Hernandez & Kosma Przyjemski

%% I. Modeling of line segments
% Image binarisation
I1 = imread('C:\Users\Zamayra\Desktop\TP_Vision\TP3_vision\images\image1.jpg');

binary_image = im2bw(I1, 0.1);

figure();
image(uint8(binary_image));
colormap(gray(256));