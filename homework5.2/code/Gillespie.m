k1=0.001;
k2=0.01;
k3=1.2;
k4=1;
a0=0;
b0=0;
gillespie2(k1,k2,k3,k4,a0,b0);
function gillespie2(k1,k2,k3,k4,a0,b0)
M=100000;
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
legend()
hold off
saveas(gcf, 'b1.png');
end