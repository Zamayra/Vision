function res = minimum_sums_haut(M,N)

matrix = M;

for x=1:3
    for y=1:3
        matrix(x,y) = sum(M(x,y)+N(x,y));
        list = [matrix(3,:), matrix(2,2), matrix(2,3)];
        res = min(list);
    end
end

