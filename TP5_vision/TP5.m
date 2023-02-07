
I = double(imread('image1.bmp'));
It2 = double(imread('image2.bmp'));

I = I(:,:,1);
It2 = It2(:,:,1);


 [Vx, Vy, lambda] = derivesFiables(I, It2, 1000);

[largeur, hauteur] = size(Vx);

k = 50;

R = 128 + k*Vx;
V = 128 + k*Vy;
B = ones(largeur, hauteur) * 255;

mouvement=zeros(largeur,hauteur,3);
mouvement(:,:,1) = R;
mouvement(:,:,2) = V;
mouvement(:,:,3) = B;

%figure();
%imagesc(I);
%colormap(gray(256));

figure();
image(uint8(mouvement));
title('Lucas & Kanade');

%On voit le mouvement dans les nombres de calendirer 


%%
seuilR = 200;
seuilV = 200;
Rabs = abs(R);
Vabs = abs(V);
Babs = B;

for x=1:largeur
    for y=1:hauteur
        if Rabs(x,y) < seuilR
            Rabs(x,y) = 0;
        end
        if Vabs(x,y) < seuilV
            Vabs(x,y) = 0;
        end
    end
end

mouvement2=zeros(largeur,hauteur,3);
mouvement2(:,:,1) = Rabs;
mouvement2(:,:,2) = Vabs;
mouvement2(:,:,3) = Babs;

figure();
image(uint8(mouvement2));
title('Valeurs fiables');


