function vect = vecteur_descriptif(image)
%Spectre en representation conventionnelle
spectre_rep_conv = fftshift(fft2(image));

%Je prendre le demi spectre car l'autre lotié du spectre est le conjugé et
%n'apporte de l'information

%Sommee des modules de coefficientes

S = size(image)

initX=1;
initY=1;

vect = [];
for i=[50, 75, 100]
    for j=[50,75,100,125,150,200]
        bloc = spectre_rep_conv(initX:i, initY:j);
        somme = sum(sum(abs(bloc)));
        vect = [vect, somme];
        initY=j;
        
    end
    initY=1;
    initX=i;
end


end