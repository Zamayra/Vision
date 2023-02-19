%% 2
% Question 1 : Combien de filtres différents pouvez-vous calculer dans un bloc 10x10 ?
% Reponse : 3300
%% Features creation
T = [];
dossier = '/Users/kosma/Desktop/UNI STUFF/Vision/TP6_vision/training/';
for i = 1:1000 % for each image       
    num = num2str(i);   
    fichier=strcat(dossier,'img',num);  
    img=imread(strcat(fichier,'.bmp'));
    V = haarfeature(img);
    T = [T;V];
end

%% Labeling (face / no face)
un = ones(500,1);
zer = zeros(500,1);
temp = [un;zer];
T = [T,temp];

%% 3 
% 1st column
num_col = 150;
F = T(:,num_col);
V = T(:,end);
[indice,se] = seuil(F,V);

%% 4
nbfeatures= 3300 ;
hauteur=4;
arbre = initForest(hauteur);

