
I = double(imread('image1.bmp'));
It2 = double(imread('image2.bmp'));

I = I(:,:,1);
It2 = It2(:,:,1);


 [Vx, Vy] = derives(I, It2);

[largeur, hauteur] = size(Vx);

k = 10;

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

%On voit le mouvement dans les nombres de calendirer 
