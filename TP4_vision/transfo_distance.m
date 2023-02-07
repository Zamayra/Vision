function TD = transfo_distance(image)

image_seuil=rgb2gray(image);

%binarisation 
image_seuil=binarisation(image_seuil);
imagesc(image_seuil),colormap gray;
image_seuil=double(image_seuil);

%transformée en distance
TD = image_seuil;

%initialisation
for x=1:100
    for y=1:100 
        if (TD(x,y)==0)
            TD(x,y)=Inf;
        else
            TD(x,y)=0;
        end
    end
end

%balayage descendant
a=3;
b=4;
for x=2:99
    for y=2:99
        res=[TD(x,y)+0,TD(x,y-1)+a,TD(x-1,y+1)+b,TD(x-1,y)+a,TD(x-1,y-1)+b];
        TD(x,y)=min(res);
    end
end

%balayage ascendant        
for x=99:-1:2
    for y=99:-1:2
        res=[TD(x,y)+0,TD(x,y+1)+a,TD(x+1,y+1)+b,TD(x+1,y)+a,TD(x+1,y-1)+b];
        TD(x,y)=min(res);
    end
end
imagesc(TD);
end