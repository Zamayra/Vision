% TP4 - Distance transform 
% Zamayra Hernandez & Kosma Przyjemski


%% I. Modeling
% binarisation :
square = imread('carre.jpg');
square = binary(square);

TD = transfDist(square);

figure()
imagesc(TD);
colormap(gray(256));


dist_square = bwdist(square);
figure()
imagesc(dist_square);
colormap(gray(256));



%{
square = im2bw(square, 0.5)
circle = imread('circle.png');
#imshow(circle);
circle = im2bw(circle, 0.5)
equilateral = imead('equilateral.png');
#imshow(equilateral);
equilateral = im2bw(equilateral, 0.5)

# calculating distance :
# Is it necessary to use chamfer mask ? 
dist_square = bwdist(square);
dist_circle = bwdist(circle);
dist_equilateral = bwdist(equilateral);
# Alternatively, one can use bwdist(binary_image, method) where method is definided as follows : 'euclidean' (default) | 'chessboard' | 'cityblock' | 'quasi-euclidean'
# useful link for chamfer distance transform : https://fr.mathworks.com/matlabcentral/fileexchange/58661-fast-chamfer-distance-transform

### II. Reconnaissance / Recognition
## binarisation of drawings:
square_drawing = imread('square_drawing.png');
#imshow(square_drawing);
square_drawing = im2bw(square_drawing, 0.5)
circle_drawing = imread('circle_drawing.png');
#imshow(circle_drawing);
circle_drawing = im2bw(circle_drawing, 0.5)
equilateral_drawing = imread('equilateral_drawing.png');
#imshow(equilateral_drawing);
equilateral_drawing = im2bw(equilateral_drawing, 0.5)

 
dist_square_drawing = bwdist(square_drawing);
dist_circle_drawing = bwdist(circle_drawing);
dist_equilateral_drawing = bwdist(equilateral_drawing);

## comparison :
# square_drawing best match
square_drawing_vs_square = norm(dist_square-dist_square_drawing);
square_drawing_vs_circle = norm(dist_circle-dist_square_drawing);
square_drawing_vs_equilateral = norm(dist_equilateral-dist_square_drawing);

if square_drawing_vs_square <= square_drawing_vs_circle && square_drawing_vs_square <= square_drawing_vs_equilateral :
    # it's a square !!! 
    disp('square')
elseif  square_drawing_vs_circle <= square_drawing_vs_square && square_drawing_vs_circle <= square_drawing_vs_equilateral :
    # it's a circle !!!
    disp('circle')
else
    disp('equilateral')
end

# circle_drawing best match
circle_drawing_vs_square = norm(dist_square-dist_circle_drawing);
circle_drawing_vs_circle = norm(dist_circle-dist_circle_drawing);
circle_drawing_vs_equilateral = norm(dist_equilateral-dist_circle_drawing);


if circle_drawing_vs_square <= circle_drawing_vs_circle && circle_drawing_vs_square <= circle_drawing_vs_equilateral :
    # it's a square !!! 
    disp('square')
elseif  circle_drawing_vs_circle <= circle_drawing_vs_square && circle_drawing_vs_circle <= circle_drawing_vs_equilateral :
    # it's a circle !!!
    disp('circle')
else
    disp('equilateral')
end

# equilateral_drawing best match
equilateral_drawing_vs_square = norm(dist_square-dist_equilateral_drawing);
equilateral_drawing_vs_circle = norm(dist_circle-dist_equilateral_drawing);
equilateral_drawing_vs_equilateral = norm(dist_equilateral-dist_equilateral_drawing);


if equilateral_drawing_vs_square <= equilateral_drawing_vs_circle && equilateral_drawing_vs_square <= equilateral_drawing_vs_equilateral :
    # it's a square !!! 
    disp('square')
elseif  equilateral_drawing_vs_circle <= equilateral_drawing_vs_square && equilateral_drawing_vs_circle <= equilateral_drawing_vs_equilateral :
    # it's a circle !!!
    disp('circle')
else
    disp('equilateral')
end

%}


