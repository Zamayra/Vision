% TP3 Hough Transforms
% Zamayra Hernandez & Kosma Przyjemski

%% I. Modeling of line segments
% Image binarisation
image = imread('image.jpeg');
%colormap(gray(256));

binary_image = im2bw(image, 0.3);
% why should we consider using gradient estimator?

%% Voting space
% constructing voting space :
% V = ???

% displaying of the voting space :
%imagesc(log(V+1));
%colormap(gray(256));

%% II. Recognition of line segments
[H,theta,rho] = hough(BW);
% can we use directly this function or must we roll out the standard algo? 
V = H; % Does H correspond to voting space in this case? 

% k may vary from 1 to 20...
% I have chosen k=4 as default to identify 4 corners visible in the image (a.k.a. 4 points with most votes), knowing their coordinantes we can estimate polar coordinantes of corresponding lines or simply draw the lines between these points.
%k = 1;
k = 4; 
%k = 10;
%k = 20;
voting_size = V.size();
kmax_values_X = [];
kmax_values_Y = [];
copyV=V;
% general idea of this algo is to look for a max point, save its coordinantes, than set the value of the point to 0 to avoid finding the same maximum. We want to find the maximum of the matrix k times to obtain k max points.
for i in k:
    % initialising max to 0 for each point to find
    max=0;
    for x in voting_size[1]: # iterating rows
        for y in voting_size[2]: # iterating collumns
            % finding max of the matrix: 
            newMax = copyV[x][y];
            if (newMax>max):
                max=newMax;
                x_max = x;
                y_max = y;
    % adding max value coordinantes to list / stocking coordinantes :
    kmax_values_X[i] = x_max;
    kmax_values_Y[i] = y_max;
    
    % setting max value to 0, this way we won't take the same point into account in the next iterration
    for x in voting_size[1]: # iterating rows
        for y in voting_size[2]: # iterating collumns
            currentValue =  copyV[x][y];
            if (currentVlue==max):
                copyV[x][y] = 0;
                
        

% plotting lines :
imshow(image);
hold on;
% we want to plot lines between each previous and next point ( "plot([y1 y2],[x1 x2],'-w');" ). This, in case when k=4, should draw a square. Of course it stronly depends on the orientation of the square.
%for i in k-1:
%    plot([kmax_values_Y[i] kmax_values_Y[i+1]],[kmax_values_X[i] kmax_values_X[i+1]],'-w');

% as the orientation of the square does not allow to simply connect each previous point to the next one, the plot for k points should be as follows : 
plot([kmax_values_Y[1] kmax_values_Y[2]],[kmax_values_X[1] kmax_values_X[2]],'-w');
plot([kmax_values_Y[1] kmax_values_Y[3]],[kmax_values_X[1] kmax_values_X[3]],'-w');
plot([kmax_values_Y[2] kmax_values_Y[4]],[kmax_values_X[2] kmax_values_X[4]],'-w');
plot([kmax_values_Y[3] kmax_values_Y[4]],[kmax_values_X[3] kmax_values_X[4]],'-w');
holf off;

%% III. Back projection of the Radon transform
% These links may be useful for Radon : 
% - https://fr.mathworks.com/help/images/ref/radon.html
% - https://fr.mathworks.com/matlabcentral/fileexchange/52577-radon-backprojection-algorithm
img = imread('image2.jpeg');
colormap(gray(256));
R = radon(img); % radon back-projection

% representation of internal organs

%% IV. Generalized Hough Transform
% IV.1 Subroutines
% a

% b

% c

%% IV.2 Modeling

