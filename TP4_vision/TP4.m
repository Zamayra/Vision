%%%% TP 4 %%%%

%% PARTIE 1 : Modelisation
% loading images
cercle=imread('cercle.png');
triangle=imread('triangle.png');
carre=imread('carre.png');

% binarisation of images is done directly in the transfo_fistance function

% transformée en distance
% used mask = [2 1 2;1 0 1;2 1 2]
figure(1)
td_cercle=transfo_distance(cercle);
title('Circle distance transform');
figure(2)
td_triangle= transfo_distance(triangle);
title('Triangle distance transform');
figure(3)
td_carre= transfo_distance(carre);
title('Square distance transform');

%% PARTIE 2 : Reconnaissance
cercle_ml=imread('cercle_ml.png');
triangle_ml=imread('triangle_ml.png');
carre_ml=imread('carre_ml.png');
% Mettre les images de base dans le rapport

% code to display binarised hanwritten images, uncomment to visualize :
%bin_cercle_ml = rgb2gray(cercle_ml);
%bin_cercle_ml =binarisation(bin_cercle_ml);
%figure(11);
%imshow(bin_cercle_ml);

%bin_triangle_ml = rgb2gray(triangle_ml);
%bin_triangle_ml =binarisation(bin_triangle_ml);
%figure(12);
%imshow(bin_triangle_ml);

%bin_carre_ml = rgb2gray(carre_ml);
%bin_carre_ml =binarisation(bin_carre_ml);
%figure(13);
%imshow(bin_carre_ml);

%Enlever coeff Inf
td_carre=td_carre(2:99,2:99);
td_cercle=td_cercle(2:99,2:99);
td_triangle=td_triangle(2:99,2:99);

%% Traitement sur l'image main levée
image_ml_bin = rgb2gray(carre_ml); % choix de l'image à reco
image_ml_bin = binarisation(image_ml_bin); 
image_ml_bin = double(image_ml_bin);
image_ml_bin = image_ml_bin(2:99,2:99);


%Comparaison de l'image main levée avec les modèles de la partie 1
score_cercle = sum(sum(image_ml_bin.*td_cercle));
score_triangle = sum(sum(image_ml_bin.*td_triangle));
score_carre = sum(sum(image_ml_bin.*td_carre));

%Tableau : 
%score carre
%score cercle
%score triangle
tableau_score_circle_ml = [score_cercle; score_triangle; score_carre]
%disp(tableau_score);


%Toutes les images reconnues, faire un tableau du score

