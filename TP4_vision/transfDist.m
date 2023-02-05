function res = transfDist(binaryImg)
%chanfrein
chanfrein = [4 3 4;
             3 0 3;
             4 3 4];

%Initialisation
[largeur, hauteur] = size(binaryImg);

Initialisation = binaryImg;
for x=1:largeur
    for y=1:hauteur
        if binaryImg(x,y)==0
            Initialisation(x,y) = Inf;
        else
            Initialisation(x,y) = 0;
        end
    end
end

%Ajoute de 2 lignes et 2 colonnes à l'infinit. 

matrix = inf(largeur+2,hauteur+2);

for x=1:largeur
    for y=1:hauteur
        matrix(x+1,y+1)=Initialisation(x,y);
    end
end

%Balayage vers le bas
for x=1:largeur
    for y=1:hauteur
        bloc_init = matrix(x:x+2,y:y+2);
        matrix(x+1,y+1) = minimum_sums_bas(bloc_init, chanfrein);
    end
end

%Balayage vers le haut
for x=largeur+2:-1:3
    for y=hauteur+2:-1:3
        %[x y]
        bloc_init = matrix(x-2:x,y-2:y);
        matrix(x-1,y-1) = minimum_sums_haut(bloc_init, chanfrein);
    end
end

res = matrix(2:largeur,2:hauteur);

