function [fenetre,ret2_im] = moravec(image, window_size, deplacement)

[x,y] = size(image);% get size
result = zeros[]

for i=window_size:x-window_size+1
    for j=window_size:y-window_size+1
        pixels = (window_size-1)/2;
        window = image(i-pixels:i+pixels, j-pixels,j+pixels);
        
        HG = window - image(i-deplacement:i+deplacement, j-deplacement,j+deplacement)
        H = 
        HD = 
        D =
        BD =
        B = 
        BG =
        G = 

        minimum = min(HG,H,HD,D,BD,B,BG,G);

    end
end