% Lire l'image dans la variable I
I = imread('moravec1_original.png');

% Convertir l'image en niveaux de gris
%I = rgb2gray(I);

% Initialiser une matrice pour stocker les scores
score = zeros(size(I));

% Boucle sur chaque pixel de l'image
for i = 6 : size(I, 1) - 6
    for j = 6 : size(I, 2) - 6
        % Initialiser une variable pour stocker la valeur minimale
        minDiff = Inf;
        % Boucle sur chaque translation de la fenêtre
        for a = [-5,-3,-1,1,3,5]
            for b = [-5,-3,-1,1,3,5]
                % Déterminer la différence entre le pixel courant
                % et le pixel dans la fenêtre translatée
                diff = abs(I(i, j) - I(i + a, j + b));
                % Mettre à jour la valeur minimale si nécessaire
                minDiff = min(minDiff, diff);
            end
        end
        % Stocker la valeur minimale en tant que score pour ce pixel
        score(i, j) = minDiff;
    end
end
figure();
imshow(I);
figure();
imshow(score);
%%
% Normaliser les scores pour qu'ils se situent entre 0 et 1
score = (score - min(score(:))) / (max(score(:)) - min(score(:)));

% Appliquer un seuil pour sélectionner les points clés
threshold = 0.1;
keypoints = (score > threshold);

% Afficher les points clés sur l'image
imshow(I);
hold on;
plot(keypoints, 'or');
hold off;

