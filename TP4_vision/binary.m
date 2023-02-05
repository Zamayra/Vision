function bw = binary(I)
I = im2bw(I, 0.5);
[largeur, hauteur] = size(I);
for x=1:largeur
    for y=1:hauteur
        if I(x,y)==1
            bw(x,y) = 0;
        else
            bw(x,y) = 1;
        end
    end
end


