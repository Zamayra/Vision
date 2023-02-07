function V=haarfeature(img)
Nofeature=0;
V=zeros(1,3300);

% feature horizontale 1
% pour toutes les largeurs possibles
for i=1:10
    % pour toutes les épaisseurs possibles
    for j=2:2:10
        % pour toutes les positions en ligne
        for x=1:10
            % pour toutes les positions en colonnes
            for y=1:10
                if(x+i-1 <11)
                    if(y+j-1 <11)
                        Nofeature=Nofeature+1;
                        V(Nofeature)= sum(sum(img(x:x+i-1,y:(y+(j/2)-1))))- sum (sum(img(x:x+i-1,y+(j/2):y+j-1))); 
                    end
                end
            end
        end
    end
end

% feature verticale
% pour toutes les largeurs possibles
for i=2:2:10
    % pour toutes les épaisseurs possibles
    for j=1:10
        % pour toutes les positions en ligne
        for x=1:10
            % pour toutes les positions en colonnes
            for y=1:10
                if(x+i-1 <11)
                    if(y+j-1 <11)
                        Nofeature=Nofeature+1;
                        V(Nofeature)= sum(sum(img(x:x+(i/2)-1,y:y+j-1))) - sum(sum(img(x:x+(i/2),y:y+j-1)));
                    end
                end
            end
        end
    end
end
% feature horizontale 2
% pour toutes les largeurs possibles
for i=1:10
    % pour toutes les épaisseurs possibles
    for j=4:4:10
        % pour toutes les positions en ligne
        for x=1:10
            % pour toutes les positions en colonnes
            for y=1:10
                if(x+i-1 <11)
                    if(y+j-1 <11)
                        Nofeature=Nofeature+1;
                        V(Nofeature)= sum(sum(img(x:x+i-1,y:(y+(j/4)-1))))+ sum(sum(img(x:x+i-1,y+(3*j/4)-1:y+j-1))) - sum (sum(img(x:x+i-1,y+(j/4):y+((3*j)/4)-1))); 
                    end
                end
            end
        end
    end
end
end