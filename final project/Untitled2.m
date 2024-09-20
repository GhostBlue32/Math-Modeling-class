% Define a sample 5x5 matrix
M = rand(5);

% Define the new size of the matrix
new_size = 8;

% Create a grid of coordinates for the original matrix
[x, y] = meshgrid(linspace(1,5,5), linspace(1,5,5));

% Create a grid of coordinates for the new matrix
[new_x, new_y] = meshgrid(linspace(1,5,new_size), linspace(1,5,new_size));

% Interpolate the original matrix to create the new matrix
new_M = interp2(x, y, M, new_x, new_y);

% Plot the original and new matrices
subplot(1,2,1);
imagesc(M);
title('Original Matrix');
subplot(1,2,2);
imagesc(new_M);
title('New Matrix');