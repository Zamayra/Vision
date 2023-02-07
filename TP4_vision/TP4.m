%%%% TP 4 %%%%

%% PARTIE 1 : Modelisation
cercle=imread('cercle.png');
triangle=imread('triangle.png');
carre=imread('carre.png');
% Mettre les images de base dans le rapport

%Binarisation + transformée en distance
%préciser le masque = [2 1 2;1 0 1;2 1 2]

figure(1)
td_cercle=transfo_distance(cercle);
title('Trans_distance du cercle');
figure(2)
td_triangle= transfo_distance(triangle);
title('Trans_distance du triangle');
figure(3)
td_carre= transfo_distance(carre);
title('Trans_distance du carre');

%% PARTIE 2 : Reconnaissance
cercle_ml=imread('cercle_ml.png');
triangle_ml=imread('triangle_ml.png');
carre_ml=imread('carre_ml.png');
% Mettre les images de base dans le rapport

%Enlever coeff Inf
td_carre=td_carre(2:99,2:99);
td_cercle=td_cercle(2:99,2:99);
td_triangle=td_triangle(2:99,2:99);

%% Traitement sur l'image main levée
image_ml_bin = rgb2gray(triangle_ml);
image_ml_bin = binarisation(image_ml_bin); %choix de l'image à reco
image_ml_bin = double(image_ml_bin);
image_ml_bin = image_ml_bin(2:99,2:99);


%Comparaison de l'image main levée avec les modèles de la partie 1
score_carre = sum(sum(image_ml_bin.*td_carre));
score_cercle = sum(sum(image_ml_bin.*td_cercle));
score_triangle = sum(sum(image_ml_bin.*td_triangle));

%Tableau : 
%score carre
%score cercle
%score triangle
tableau_score = [score_carre;score_cercle;score_triangle];
disp(tableau_score);


%Toutes les images reconnues, faire un tableau du score

