function [indice,se]=seuil(F,V)

mat = [F,V];
mat = sortrows(mat);
errors = [];
verite_terrain = mat(:,2);
for i = 1:1000
    mat_0 = verite_terrain(1:i);
    mat_1 = verite_terrain(i:end);
    err_11 = size(find(mat_0),1);
    err_12 = 1000 - i - size(find(mat_1),1);
    err1 = err_11 + err_12;
    
    err_21 = i - size(find(mat_0),1);
    err_22 = size(find(mat_1),1);
    err2 = err_21 + err_22;
    
    err = min(err1,err2);
    errors = [errors;err];
end
[x,indice] = min(errors);
se = mat(indice);
end