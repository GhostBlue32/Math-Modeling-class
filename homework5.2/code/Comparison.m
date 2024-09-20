k1=0.001;
k2=0.01;
k3=1.2;
k4=1;
a0=0;
b0=0;
gillespie2(500,k1,k2,k3,k4,a0,b0,'a1.png');
gillespie2(500,k1,k2,k3,k4,a0,b0,'a2.png');
gillespie2(500,k1,k2,k3,k4,a0,b0,'a3.png');
gillespie2(500,k1,k2,k3,k4,a0,b0,'a4.png');
gillespie2(500,k1,k2,k3,k4,a0,b0,'a5.png');
gillespie2(500,k1,k2,k3,k4,a0,b0,'a6.png');
gillespie2(1000,k1,k2,k3,k4,a0,b0,'b1.png');
gillespie2(1000,k1,k2,k3,k4,a0,b0,'b2.png');
gillespie2(1000,k1,k2,k3,k4,a0,b0,'b3.png');
gillespie2(1000,k1,k2,k3,k4,a0,b0,'b4.png');
gillespie2(1000,k1,k2,k3,k4,a0,b0,'b5.png');
gillespie2(1000,k1,k2,k3,k4,a0,b0,'b6.png');
function gillespie2(m,k1,k2,k3,k4,a0,b0,name)
M=m;
T=zeros(M+1,1);
A=zeros(M+1,1);
B=zeros(M+1,1);
t=0;
A(1)=a0;
B(1)=b0;
a=a0;
b=b0;
for i=2:M+1
    r1=rand;
    r2=rand;
    alpha1=a*(a-1)*k1;
    alpha2=b*a*k2;
    alpha3=k3;
    alpha4=k4;
    alpha=alpha1+alpha2+alpha3+alpha4;
    t=t+log(1/r1)/(alpha);
    if r2<alpha1/alpha
        a=a-2;
    elseif r2<(alpha1+alpha2)/alpha
        a=a-1;
        b=b-1;
    elseif r2<(alpha1+alpha2+alpha3)/alpha
        a=a+1;
    else 
        b=b+1;
    end
    A(i)=a;
    B(i)=b;
    T(i)=t;
end
plot(T,A, 'LineWidth', 1,'DisplayName', 'Number of Molecule A');hold on
plot(T,B,'lineWIdth',1,'DisplayName','Number of Molecule B');
[T2,AB]=ode45(@(t,ab) crk(t,ab,k1,k2,k3,k4),[0,T(M+1)],[0,0]);
plot(T2,AB(:,1),'lineWIdth',1,'DisplayName','deterministic function A')
plot(T2,AB(:,2),'lineWIdth',1,'DisplayName','deterministic function B')
legend()
hold off
saveas(gcf, name);
end

function dadb=crk(t,ab,k1,k2,k3,k4)
dadb=zeros(2,1);
dadb(1)=-2*k1*ab(1)*ab(1)-k2*ab(1)*ab(2)+k3;
dadb(2)=-k2*ab(1)*ab(2)+k4;
end