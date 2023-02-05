img = double(imread('Lena.jpg'));
% affichage
%imagesc(uint8(img));
%colormap(gray(256));


% Image u spectre de Fourier
imgSpectFourier = fftshift(fft2(img));
% affichage
%figure();
%imagesc(uint8(log(abs(imgSpectFourier))));
%colormap(gray(256));

n = 1;
s = size(imgSpectFourier);
nb_lignes = s(1);
nb_colonnes = s(2);
modified_image = imgSpectFourier;

EQM = [];
nb_pixels_suprimees = [];
% affichage
%figure();
while n < nb_colonnes/2-1 
    %Set to zero the first n rows, the last n rows, the first
    %n columns and the last n columns of the spectrum in its
    %conventional representation

    % first n rows
    modified_image(n,:) = zeros(1,nb_colonnes); 
    % last n rows
    modified_image(nb_lignes-(n-1),:) = zeros(1,nb_colonnes); 
    % first n columns
    modified_image(:,n) = zeros(nb_lignes,1); 
    % last n columns
    modified_image(:,nb_colonnes-(n-1)) = zeros(nb_lignes,1); 
    
    nb_pixels_suprimees = [nb_pixels_suprimees, nb_lignes*nb_colonnes - ((nb_colonnes-2*n)*(nb_lignes-2*n))];
    
    %Compute the inverse transform to produce the filtered
    %image
    modified_spectre = fftshift(modified_image);
    filtred_image = ifft2(modified_spectre);
    
    % affichage
    %imagesc(uint8(abs(filtred_image)));
    %colormap(gray(256));
    %pause(); % press a key to continue
    
    %Compute the Mean Square Error between the starting image
    %and the new filtered image
    err = immse(img,filtred_image);
    EQM= [EQM, err];
    
    % iter condition
    n = n + 1;
end

maxEQM = max(EQM);
EQMpourcentage = EQM/maxEQM*100;

coeff_mise_a_zero_pourcentage = nb_pixels_suprimees/(nb_lignes*nb_colonnes)*100;

%figure()
%plot(EQMpourcentage);

%hold on
%plot(coeff_mise_a_zero_pourcentage);
%legend('EQM','Coeff mise à zero')

%% II. CARACTERISATION
% question 1 
% ( 1 seul image ) 
chemin='data/01.jpg';
I = double(imread(chemin));
signature_one_image = vecteur_descriptif(I);

%% ( matrice 50 images *18 caracteristiques)
nbimg=50;
chemin='data/';
signature_matrix=zeros(nbimg,18);
for i=1:nbimg
   unite=num2str(mod(i,10));
   centaine=floor(i/100);
   dizaine=num2str(floor((i-centaine*100)/10));
   fichier=strcat(chemin,dizaine,unite);
   clear img;
   img=double(imread(fichier,'jpg'));
   signature_matrix(i,:)=vecteur_descriptif(img);
end

%% Question 2 - distance de Manhattan

[similar_image4, min_manhattan_dist4] = get_most_similar_image(4, signature_matrix);
[similar_image10, min_manhattan_dist10] = get_most_similar_image(10, signature_matrix);
[similar_image30, min_manhattan_dist30] = get_most_similar_image(30, signature_matrix);
[similar_image44, min_manhattan_dist44] = get_most_similar_image(44, signature_matrix);

