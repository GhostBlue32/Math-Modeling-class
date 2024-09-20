
m = 0;
x = linspace(0,1,100); % Spatial domain
t = linspace(0,1,100); % Time domain
sol = pdepe(m,@pdefun,@ic,@bc,x,t); % Solving the PDE

% Plot the solution
surf(x,t,sol);
xlabel('Distance x');
ylabel('Time t');
zlabel('p');
title('PDE Solution');

% Define the PDE equation
function [c,f,s] = pdefun(x,t,u,DuDx)
a = 1; % Coefficient a
D = 0.1; % Coefficient D
c = 1;
f = -a*DuDx + D*DuDx.^2;
s = 0;
end

% Define the initial condition
function u0 = ic(x)
u0 = sin(pi*x);
end

% Define the boundary conditions
function [pl,ql,pr,qr] = bc(xl,ul,xr,ur,t)
pl = ul;
ql = 0;
pr = ur;
qr = 0;
end