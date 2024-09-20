deltat=0.001;
Da=10;
Dh=200;
N=100;
a0=0.1+0.9*rand(N,N);
h0=0.1*ones(N,N);
aold=a0;
hold=h0;
t=0;
L=lap2d(N,N);
k=0;
while t<100
    aold=aold+deltat*(f1(aold,hold)+Da*reshape((L*reshape(aold,N*N,1)),N,N));
    hold=hold+deltat*(f2(aold,hold)+Dh*reshape((L*reshape(hold,N*N,1)),N,N));
    t=t+deltat;
    k=k+1;
    if mod(k,100)==0
        figure(1);
        pcolor(aold);
        colormap('gray');
        shading flat;
    end
end



function f1e=f1(a,h)
c1=1;
K=0.03;
mu=1;
f1e=c1*a.^2./(h.*(1+K*a.^2))-mu*a;
end

function f2e=f2(a,h)
c2=1;
v=1.2;
f2e=c2*a.^2-v*h;
end


% lap2d.m
%
% form the (scaled) matrix for the 2D Laplacian for Neumann boundary
% conditions on a rectangular node-centered nx by ny grid
%
% input: nx -- number of grid points in x-direction (no bdy pts)
%        ny -- number of grid points in y-directio
%
% output: L2 -- (nx*ny) x (nx*ny) sparse matrix for discrete Laplacian


function L2 = lap2d( nx,ny )

% make 1D Laplacians
%
Lx = lap1d(nx);
Ly = lap1d(ny);

% Neumann BC on y-direction
Lx(1,1) = -1;
Lx(1,2) = 1;
Lx(nx,nx-1) = 1;
Lx(nx,nx) = -1;

% Neumann BC on x-direction
Ly(1,1) = -1;
Ly(1,2) = 1;
Ly(ny,ny-1) = 1;
Ly(ny,ny) = -1;

% make 1D identities
%
Ix = speye(nx);
Iy = speye(ny);

% form 2D matrix from kron
%
L2 = kron(Iy,Lx) + kron(Ly,Ix);

end


% lap1d
%
% form the (scaled) 1D Laplacian for Dirichlet boundary conditions
% on a node-centered grid
%
% input: n -- number of grid points (no bdy pts)
%
% output: L -- n x n sparse matrix for discrete Laplacian


function L = lap1d(n)

e=ones(n,1);
L = spdiags([e -2*e e],[-1 0 1],n,n);

end
