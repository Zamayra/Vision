function res = minimum_sums_bas(M,N)

matrix = M;

for x=1:3
    for y=1:3
        matrix(x,y) = sum(M(x,y)+N(x,y));
        list = [matrix(1,:), matrix(2,1), matrix(2,2)];
        res = min(list);
    end
end

