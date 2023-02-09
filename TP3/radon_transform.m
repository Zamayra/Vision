function R = radon_transform(image)
    % this function implements the algo of The Radon Transform which is an
    % extension of The Hough Transform. 
    % The function returns the voting space.
    [width, height] = size(image);
    diagonal=round(sqrt(width^2+height^2));
    R=zeros(diagonal,628);
    epsilum = 0.1;
    for x = 1:width
        for y=1:height 
            if image(x,y)~=0
                for theta=1:628
                    rho=round(abs(x*cos(theta/100)+y*sin(theta/100)));
                    if rho>=1 && rho<=628
                        if abs(x*cos(theta/100)+y*sin(theta/100)-rho) < epsilum
                            R(rho,theta) = R(rho,theta) + image(x,y);   
                        end
                    end
                end
            end
        end
    end         
end