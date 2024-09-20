% Define sphere parameters
radius = 100; % sphere radius
center = [0 0 0]; % sphere center
theta0=-pi/2;
fie0=pi/4;

% Define track parameters
theta = zeros(1,100);
fie=zeros(1,100);
theta(1)=theta0;
fie(1)=fie0;
k=-1;
for i=2:100
    if i==50
        k=1;
    end
    theta(i)=theta(i-1)+randn*pi/100+pi/90;
    fie(i)=fie(i-1)+randn*pi/500+pi/250*k;
end
x=radius*sin(fie).*cos(theta);
y=radius*sin(fie).*sin(theta);
z=radius*cos(fie);

% Plot sphere
load('worldmap.mat', 'worldmap', 'lat', 'long')
[xs, ys, zs] = sphere(20);
xs = radius * xs + center(1);
ys = radius * ys + center(2);
zs = radius * zs + center(3);
surf(xs, ys, zs, 'FaceColor', 'texturemap', 'EdgeColor', 'none', 'Cdata', worldmap)
hold on;

% Plot track
plot3(x,y,z,'r','LineWidth',2);
axis equal;
hold off;