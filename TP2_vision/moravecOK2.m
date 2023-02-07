function corners = moravecOK2(image)

% Définir la taille de la fenêtre
windowSize = 11;

% Déterminer les dimensions de l'image
[rows, cols] = size(image);

% Initialiser la matrice de la saillance SM
SM = zeros(rows, cols);

% Boucle sur les pixels de l'image
for r = (windowSize+1)/2 : rows-(windowSize-1)/2
    for c = (windowSize+1)/2 : cols-(windowSize-1)/2
        
        % Initialiser la variable de saillance minimale
        minResponse = Inf;
        
        % Boucle sur les translations de la fenêtre
        for a = -5 : 5
            for b = -5 : 5
                
                % Extraire la sous-image à l'emplacement actuel
                subImage = image(r+a : r+a+windowSize-1, c+b : c+b+windowSize-1);
                
                % Calculer la différence entre la sous-image et la translation opposée
                diffImage = subImage - image(r-a : r-a+windowSize-1, c-b : c-b+windowSize-1);
                
                % Calculer la somme des différences au carré
                sumDiff = sum(diffImage(:).^2);
                
                % Mettre à jour la saillance minimale
                minResponse = min(minResponse, sumDiff);
            end
        end
        
        % Stocker la saillance minimale pour le pixel actuel
        SM(r,c) = minResponse;
    end
end

% Appliquer un seuil à la matrice de saillance SM
threshold = mean2(SM) + 3 * std2(SM);
SM(SM < threshold) = 0;

% Utiliser la fonction "imregionalmax" pour trouver les coins locaux
corners = imregionalmax(SM);

end
