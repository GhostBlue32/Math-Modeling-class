G=1;
m0=10;
n0=2;
t0=2*pi;
r0=[1,0,0,1];
r1=[0.4,0.6,-0.6,0.4];
opt1=odeset('MaxStep',t0/200);
[T1,R1]=ode45(@(t,r) myode(t,r,n0),[0 t0],r0,opt1);
[T2,R2]=ode45(@(t,r) myode(t,r,n0),[0 t0],r1,opt1);
[theta1,rho1]=cart2pol(R1(:,1),R1(:,2));
figure(1)
polarplot(theta1,rho1);
[theta2,rho2]=cart2pol(R2(:,1),R2(:,2));
title('Plots of orbit,initial condition [1,0,0,1]');
figure(2)
polarplot(theta2,rho2);
title('Plots of orbit,initial condition [0.6,0.8,-0.8,0.6]');
figure(3)
E=zeros(size(T1));
[m,n]=size(T1);
for i=1:m
    E(i,:)=-G*m0/norm(R1(i,1:2))+(norm(R1(i,3:4))^2)/2;
end
plot(T1,E)
figure(4)
E=zeros(size(T2));
[m,n]=size(T2);
for i=1:m
    E(i,:)=-G*m0/norm(R2(i,1:2))+(norm(R2(i,3:4))^2)/2;
end
plot(T2,E)
function drdt=myode(t,r,n)%in r and drdt 1-n is the original function,n+1-2n is dirivative
G=1;
m0=1.0;
drdt=zeros(2*n,1);
r2=norm(r(1:n));
for i=1:n
    drdt(i)=r(n+i);
    drdt(n+i)=-G*m0*r(i)/(r2^3);
end
end
