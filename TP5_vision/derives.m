function [Vx, Vy, lambda] = derives(I, It2)

[largeur, hauteur] = size(I);

Vx = I(1:largeur-2,1:hauteur-2);
Vy = Vx;
lambda = [];

for x=1:largeur-3
    for y=1:hauteur-3
        %Pour chaque pixel calculer : 
        voisinage = I(x:x+3,y:y+3);
        
        %derive X
        derive_X = [voisinage(1:3, 2)-voisinage(1:3,1), voisinage(1:3, 3)-voisinage(1:3,2), voisinage(1:3, 4)-voisinage(1:3,3)];
        derive_X2 = derive_X.^2;
        sumX2 = sum(derive_X2,'all');
        
        %derive Y
        derive_Y = [voisinage(2,1:3)-voisinage(1,1:3); voisinage(3,1:3)-voisinage(2,1:3); voisinage(4,1:3)-voisinage(3,1:3)];
        derive_Y2 = derive_Y.^2;
        sumY2 = sum(derive_Y2, 'all');
        
        %derive t
        derive_t = It2(x:x+2,y:y+2) -I(x:x+2,y:y+2);
        
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
        lambda = [lambda, eig(H)];

        Vx(x,y) = V(1);
        Vy(x,y) = V(2);
        
        
 
    end
end

end