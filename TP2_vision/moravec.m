function [ret1_im,ret2_im] = moravec(ori_img)


    if size(size(ori_img))~=2
        ori_img = rgb2gray(ori_img); % grayscale image
    end
    
    [height,width] = size(ori_img);% get size
    tmp = zeros(size(ori_img));

    %%%% Moravec
    %% get corness
    for i=6:height-5
        for j = 6:width-5      
            E = zeros(1,8);% store cornerness
            E(1) = sum(sum((ori_img(i-2:i,j-1:j+1)-ori_img(i-1:i+1,j-1:j+1)).^2)); % up
            E(2) = sum(sum((ori_img(i-2:i,j:j+2)-ori_img(i-1:i+1,j-1:j+1)).^2)); % up-right
            E(3) = sum(sum((ori_img(i-1:i+1,j:j+2)-ori_img(i-1:i+1,j-1:j+1)).^2));% right
            E(4) = sum(sum((ori_img(i:i+2,j:j+2)-ori_img(i-1:i+1,j-1:j+1)).^2));% down-right
            E(5) = sum(sum((ori_img(i:i+2,j-1:j+1)-ori_img(i-1:i+1,j-1:j+1)).^2)); % down
            E(6) = sum(sum((ori_img(i:i+2,j-2:j)-ori_img(i-1:i+1,j-1:j+1)).^2)); % down-left
            E(7) = sum(sum((ori_img(i-1:i+1,j-2:j)-ori_img(i-1:i+1,j-1:j+1)).^2));% left
            E(8) = sum(sum((ori_img(i-2:i,j-2:j)-ori_img(i-1:i+1,j-1:j+1)).^2)); % left-up
            corness = min(E); % corness
            tmp(i,j) = corness;
        end
    end

    %% find local minima
    t_mav = 0.5; % threshold
    R_max = max(tmp(:)); % get maximum value
    loc = [];% store location
    ind = 1; % index
    for i=2:height-1
        for j=2:width-1

            if (tmp(i,j)>t_mav*R_max &&...
               tmp(i,j)>tmp(i-1,j-1) && tmp(i,j)>tmp(i-1,j) && tmp(i,j)>tmp(i-1,j+1) &&...
               tmp(i,j)>tmp(i,j-1) && tmp(i,j)>tmp(i,j+1) &&...
               tmp(i,j)>tmp(i+1,j-1) && tmp(i,j)>tmp(i+1,j) && tmp(i,j)>tmp(i+1,j+1))
                    loc(ind,1) = i; % store x coordinate
                    loc(ind,2) = j; % store y coordinate
                    ind = ind + 1;
            end

        end
    end
    ret1_im = tmp;
    %% display
    figure;imshow(ori_img);hold on;title('Moravec Dector');
    for i = 1:size(loc,1) % get first thresh maximum values

        co_x = loc(i,1);
        co_y = loc(i,2);
        x = co_x-2:1:co_x+2;
        y = co_y-2:1:co_y+2;
        scatter(y,x,'g','filled');hold on;

    end

    %%%% Harris
    ori_imgd = double(ori_img);
    [dx,dy] = gradient(ori_imgd); % get gradient
    gauss = 1/6*[1 4 1];%1D gauss kernel

    %% get H
    sx2 = dx.*dx; 
    sy2 = dy.*dy;
    sxy = dx.*dy;

    %% smooth H
    k = 0.01;
    win = gauss'*gauss; % 2D guass kernel
    Sx2 = filter2(win,sx2);
    Sy2 = filter2(win,sy2);
    Sxy = filter2(win,sxy);

    %% get R
    R = zeros(height,width);
    for i=1:height
        for j = 1:width
            H = [Sx2(i,j),Sxy(i,j);Sxy(i,j),Sy2(i,j)];
            R(i,j) = det(H) - k*(trace(H))^2;
        end   
    end
    R_max = max(R(:)); % get maximum value in R

    %% find local minima
    t_h = 0.1; % threshold
    tmp = R;
    loc = [];% store location
    ind = 1; % index
    for i=2:height-1
        for j=2:width-1

            if (tmp(i,j)>t_h*R_max &&...
               tmp(i,j)>tmp(i-1,j-1) && tmp(i,j)>tmp(i-1,j) && tmp(i,j)>tmp(i-1,j+1) &&...
               tmp(i,j)>tmp(i,j-1) && tmp(i,j)>tmp(i,j+1) &&...
               tmp(i,j)>tmp(i+1,j-1) && tmp(i,j)>tmp(i+1,j) && tmp(i,j)>tmp(i+1,j+1))
                    loc(ind,1) = i; % store x coordinate
                    loc(ind,2) = j; % store y coordinate
                    ind = ind + 1;
            end

        end
    end

    %% display
    figure;imshow(ori_img);hold on;title('Harris Dector');
    for i = 1:size(loc,1) % get first thresh maximum values

        co_x = loc(i,1);
        co_y = loc(i,2);
        x = co_x-2:1:co_x+2;
        y = co_y-2:1:co_y+2;
        scatter(y,x,'r','filled');hold on;

    end
    ret2_im = tmp;
end