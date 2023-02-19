function V=haarfeature(img)
Nofeature=1;
V=zeros(1,3300);

%% horizontal feature 1
for i=1:10  % for each possible lenght point
    for j=2:2:10 % for each possible width point
        for x=1:10  % for each row
            for y=1:10  % for each column
                if(x+i-1 <11)
                    if(y+j-1 <11)
                        V(Nofeature)= sum(sum(img(x:x+i-1,y:(y+(j/2)-1))))- sum (sum(img(x:x+i-1,y+(j/2):y+j-1))); 
                        Nofeature=Nofeature+1;
                    end
                end
            end
        end
    end
end

%% vertical feature 
for i=2:2:10 % for each lenght point
    for j=1:10 % for each width point
        for x=1:10  % for each row
            for y=1:10 % for each column
                if(x+i-1 <11)
                    if(y+j-1 <11)
                        V(Nofeature)= sum(sum(img(x:x+(i/2)-1,y:y+j-1))) - sum(sum(img(x:x+(i/2),y:y+j-1)));
                        Nofeature=Nofeature+1;
                    end
                end
            end
        end
    end
end

%% feature horizontale 2
for i=1:10 % for each possible lenght point
    for j=4:4:10 % for each possible width point
        for x=1:10 % for each row
            for y=1:10 % for each column
                if(x+i-1 <11)
                    if(y+j-1 <11)
                        V(Nofeature)= sum(sum(img(x:x+i-1,y:(y+(j/4)-1))))+ sum(sum(img(x:x+i-1,y+(3*j/4)-1:y+j-1))) - sum (sum(img(x:x+i-1,y+(j/4):y+((3*j)/4)-1))); 
                        Nofeature=Nofeature+1;
                    end
                end
            end
        end
    end
end
end