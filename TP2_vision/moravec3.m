function [ points ] = moravec( I, windowsize, step )
% Initialize the minimum eigenvalue matrix
E = zeros(size(I, 1), size(I, 2));

% Compute the sum of squares for each displacement
for dx = [-1, 0, 1]
    for dy = [-1, 0, 1]
        if dx == 0 && dy == 0
            continue;
        end
        
        % Compute the differences for each pixel
        x_start = windowsize + 1;
        x_end = size(I,1) - windowsize;
        y_start = windowsize + 1;
        y_end = size(I,2) - windowsize;
        D = double(I(x_start:x_end, y_start:y_end)) - ...
            double(I(x_start+dx:x_end+dx, y_start+dy:y_end+dy));
        
        % Compute the sum of squares
        S = sum(D.^2, 3);
        
        % Update the minimum eigenvalue
        E(x_start:x_end, y_start:y_end) = min(E(x_start:x_end, y_start:y_end), S);
    end
end

% Non-maximum suppression
points = [];
for i = windowsize+step:step:size(I, 1)-windowsize-step
    for j = windowsize+step:step:size(I, 2)-windowsize-step
        % Check if the current point is a local maximum
        if E(i, j) >= max(max(E(i-step:i+step, j-step:j+step)))
            points = [points; [i, j]];
        end
    end
end

% Display the keypoints on the input image
imshow(I, []); hold on;
plot(points(:,2), points(:,1), 'or', 'MarkerSize', 5, 'LineWidth', 2);
hold off;

end

