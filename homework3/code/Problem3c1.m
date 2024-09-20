n0=2;
t0=8*pi;
a=0.8;
b=1.4;
cos1=0.6;
sin1=0.8;
r0=[0.4*a*cos1,0.4*b*sin1,-a*sin1/sqrt(0.4),b*cos1/sqrt(0.4)];
r1=[0.5*a*cos1,0.5*b*sin1,-a*sin1/sqrt(0.5),b*cos1/sqrt(0.5)];
r2=[0.6*a*cos1,0.6*b*sin1,-a*sin1/sqrt(0.6),b*cos1/sqrt(0.6)];
r3=[0.8*a*cos1,0.8*b*sin1,-a*sin1/sqrt(0.8),b*cos1/sqrt(0.8)];
r4=[a*cos1,b*sin1,-a*sin1,b*cos1];
opt1=odeset('MaxStep',2*pi/50);
sol0=ode45(@(t,r) myode(t,r,n0),[0 t0],r0,opt1);
sol1=ode45(@(t,r) myode(t,r,n0),[0 t0],r1,opt1);
sol2=ode45(@(t,r) myode(t,r,n0),[0 t0],r2,opt1);
sol3=ode45(@(t,r) myode(t,r,n0),[0 t0],r3,opt1);
sol4=ode45(@(t,r) myode(t,r,n0),[0 t0],r4,opt1);
Nt=400;
t=linspace(0,t0,Nt);
R0=deval(sol0,t);
R1=deval(sol1,t);
R2=deval(sol2,t);
R3=deval(sol3,t);
R4=deval(sol4,t);

vidobj = VideoWriter('movie1.mp4','mpeg-4');
open(vidobj);
for k=1:Nt
    scatter(0,0,50,'rd','markerfacecolor','r'); hold on;
    scatter(R0(1,k),R0(2,k),20,'ok','markerfacecolor','k');
    scatter(R1(1,k),R1(2,k),20,'ok','markerfacecolor','y');
    scatter(R2(1,k),R2(2,k),40,'ok','markerfacecolor','b');
    scatter(R3(1,k),R3(2,k),40,'ok','markerfacecolor','r');
    scatter(R4(1,k),R4(2,k),80,'ok','markerfacecolor','m');
    plot(R0(1,1:80),R0(2,1:80));
    plot(R1(1,:),R1(2,:));
    plot(R2(1,:),R2(2,:));
    plot(R3(1,:),R3(2,:));
    plot(R4(1,:),R4(2,:));
    xlim([-3 1]);
    ylim([-1.3 2.1]);
    pbaspect([100 100 1])
    set(gca,'FontSize',20);
    set(gcf,'color','w');
    box on;
    title('My solar system');
    currFrame = getframe(gcf);
    hold off;
    writeVideo(vidobj,currFrame);
end
close(vidobj);


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