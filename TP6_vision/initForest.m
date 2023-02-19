function arbre = initForest(hauteur)
%   Creation d'une structure d'arbre binaire
%   hauteur est le nombre d'étages dans l'arbre en incluant celui de la racine et celui des feuilles

nbfeuilles=2^(hauteur-1);
arbre=zeros(nbfeuilles,hauteur+1,2);
end

