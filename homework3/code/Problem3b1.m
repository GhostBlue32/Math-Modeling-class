G=1;
m0=1;
n0=2;
N=10000;
%r and v are row vector each one
r=zeros(N+1,n0);
v=zeros(N+1,n0);
a=1.2;
b=1.5;
cos1=0.6;
sin1=0.8;
% a=1;
% b=1;
% cos1=sqrt(2)/2;
% sin1=sqrt(2)/2;
r(1,:)=[a*cos1,b*sin1];
v(1,:)=[-a*sin1,b*cos1];
T=2*pi*norm(r(1,:))/norm(v(1,:));
dt=T/N;
for i=2:N+1
    r(i,:)=r(i-1,:)+dt*v(i-1,:);
    v(i,:)=v(i-1,:)+dt*(-G*m0*r(i-1,:)/(norm(r(i-1,:)))^3);
end
figure(1)
[theta1,rho1]=cart2pol(r(:,1),r(:,2));
polarplot(theta1,rho1);
figure(2)
t1=linspace(0,T,N+1);
E=zeros(N+1,1);
for i=1:N+1
    E(i,:)=-G*m0/norm(r(i,:))+(norm(v(i,:))^2)/2;
end
plot(t1,E);

%Verlet's method 
r1=zeros(N+1,n0);
v1=zeros(N+1,n0);
r1(1:2,:)=r(1:2,:);
v1(1:2,:)=v(1:2,:);
for i=3:N+1
   r1(i,:)=2*r1(i-1,:)-r1(i-2,:)+dt^2*(-G*m0*r1(i-1,:)/(norm(r1(i-1,:)))^3);
   v1(i-1,:)=(r1(i,:)-r1(i-2,:))/(2*dt);
end
v1(N+1,:)=v1(N,:)+dt*(-G*m0*r1(N,:)/(norm(r1(N,:)))^3);
figure(3)
[theta2,rho2]=cart2pol(r1(:,1),r1(:,2));
polarplot(theta2,rho2);
figure(4)
t2=linspace(0,T,N+1);
E1=zeros(N+1,1);
for i=1:N+1
    E1(i,:)=-G*m0/norm(r1(i,:))+(norm(v1(i,:))^2)/2;
end
plot(t2,E1);


%ode45
r0=[a*cos1,b*sin1,-a*sin1,b*cos1];
opt1=odeset('MaxStep',T/500);
[T1,R1]=ode45(@(tk,rk) myode(tk,rk,n0),[0 20*T],r0,opt1);
figure(5)
[theta3,rho3]=cart2pol(R1(:,1),R1(:,2));
polarplot(theta3,rho3);
figure(6)
t2=linspace(0,T,N+1);
E2=zeros(size(T1));
[m,n]=size(T1);
for i=1:m
    E2(i,:)=-G*m0/norm(R1(i,1:2))+(norm(R1(i,3:4))^2)/2;
end
plot(T1,E2)
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






