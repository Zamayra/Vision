%%%%%%% PARTIE 2 %%%%%%%%%%%
%Combien de filtres différents pouvez-vous calculer dans un bloc 10x10 ?
%  3300
%% Creation des features
T = [];
dossier = '/Users/kosma/Desktop/TP6/training/';
for i = 1:1000       
    num = num2str(i);   
    fichier=strcat(dossier,'img',num);  
    img=imread(strcat(fichier,'.bmp'));
    V = haarfeature(img);
    T = [T;V];
end
%% Ajout du label visage ou pas visage
un = ones(500,1);
zer = zeros(500,1);
temp = [un;zer];
T = [T,temp];

%%%%%%% PARTIE 3 %%%%%%%%%%%
%%
%1ère colonne
num_col = 1;
F = T(:,num_col);
V = T(:,end);
[indice,se] = seuil(F,V);

