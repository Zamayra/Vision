function mouvement = derivesFiablesVoisinage(I, It2, seuil, neighborhood, k)
% neighborhood need to be a number impair
% neighborhood = 3    3x3 8 voisins
% neighborhood = 5    5x5 24 voisins

[largeur, hauteur] = size(I);

Vx = I(1:largeur-2,1:hauteur-2);
Vy = Vx;
lambdaVector = [];

for x=1:largeur-neighborhood
    for y=1:hauteur-neighborhood
        %Pour chaque pixel calculer : 
        voisinage = I(x:x+neighborhood,y:y+neighborhood);
        
        derive_X = [];
        derive_Y = [];

        for i=1:neighborhood
            derive_X = [derive_X, voisinage(1:neighborhood,i+1)-voisinage(1:neighborhood,i)];
            derive_Y = [derive_Y; voisinage(i+1,1:neighborhood)-voisinage(i,1:neighborhood)];
        end

        derive_X2 = derive_X.^2;
        sumX2 = sum(derive_X2,'all');
        
        derive_Y2 = derive_Y.^2;
        sumY2 = sum(derive_Y2, 'all');
        
        %derive t
        derive_t = It2(x:x+neighborhood-1,y:y+neighborhood-1) -I(x:x+neighborhood-1,y:y+neighborhood-1);
        
        %size(derive_X)
        %size(derive_Y)
        %size(derive_t)
        XY = derive_X .* derive_Y;
        sumXY = sum(XY,'all');
        Xt = sum(derive_X .* derive_t);
        sumXt = sum(Xt);
        Yt = sum(derive_Y .* derive_t);
        sumYt = sum(Yt);

        H = [sumX2 sumXY; 
             sumXY sumY2];
        b = [sumXt;
             sumYt];
         
        V = linsolve(H,-b);
        lambda = round(eig(H));


        lambdaVector = [lambdaVector, lambda];
        if lambda<seuil
            Vx(x,y) = 0;
            Vy(x,y) = 0;
        else
            Vx(x,y) = V(1);
            Vy(x,y) = V(2);
        end
 
    end
end


[largeur, hauteur] = size(Vx);

R = 128 + k*Vx;
V = 128 + k*Vy;
B = ones(largeur, hauteur) * 255;

mouvement=zeros(largeur,hauteur,3);
mouvement(:,:,1) = R;
mouvement(:,:,2) = V;
mouvement(:,:,3) = B;

end