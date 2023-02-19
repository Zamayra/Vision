function image=binarisation(image)
for i=1:size(image,1)
    for j=1:size(image,2)
        if (image(i,j)>150)
            image(i,j)=0;
        else
            image(i,j)=255;
        end
    end
end
end