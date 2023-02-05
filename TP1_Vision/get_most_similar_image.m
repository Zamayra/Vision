function [indice_min_dist, min_manhattan_dist]  = get_most_similar_image(indice_image, signature_matrix)
% Choisir une image dans la collection. Calculer la distance de Manhattan entre le vecteur associé à l'image choisie
% et ceux de toutes les autres images. Identifiez l'image la plus similaire au sens de cette distance.
% Effectuez plusieurs tests. Pour chacun d'eux, indiquez quelle est l'image choisie, celle qui est identifiée 
% comme étant la plus similaire. Donnez la valeur de la distance minimale et commentez votre résultat.

S = size(signature_matrix);
manhattan_dist = [];

for i=1:S(1) % parcour d'images
   if i~=indice_image 
       manhattan_dist = [manhattan_dist sum(abs(signature_matrix(indice_image,:) - signature_matrix(i,:)))];
   else 
       manhattan_dist = [manhattan_dist 1000000000000]; % on interdit que le min soit la meme image
   end
end

min_manhattan_dist = min(manhattan_dist); % rechercher de miniumum
indice_min_dist = find(manhattan_dist==min_manhattan_dist); % indice correspondante au min
manhattan_dist=[];

end