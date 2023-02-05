function a,b = saillanceMoravec(I)

s = size(I);
min = 1000000000000;
listeAB = [-5,-3,-1,1,3,5];

filter = ones(11,11);
UV = [-5,-4,-3,-2,-1,0,1,2,3,4,5];

for i=1:6
    a = listeAB(i);
    for j=1:6
        b = listeAB(j);
        for x=6:s(1)-5
            for y=6:s(2)-5
                for m=1:11
                    u=UV(m);
                    for n=1:11
                        v=UV(n);
                        smX = u*abs((x+u)-(x+u+a))
                        smY = v*abs((y+v)-(y+v+a))
                    end
                end
            end
        end
    end
end
% valeurs possibles de a et b 

% parcour d'image et le calcul de la somme

    



end