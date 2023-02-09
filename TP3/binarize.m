function binary_image = binarize(image, threshold)
    % cette fonction binarise l'image d'entree avec le seuil  
    binary_image = image;
    [width, height] = size(image);
    for x = 1:width
        for y=1:height
            if image(x,y)<threshold
                binary_image(x,y)=0;
            else
                binary_image(x,y)=1;
            end
        end
    end
end