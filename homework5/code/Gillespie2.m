k1=2;
k2=4;
n0=100;
[T1,A1]=gillespie2(k1,k2,n0,'c1.png');
[T2,A2]=gillespie2(k1,k2,n0,'c2.png');
[T3,A3]=gillespie2(k1,k2,n0,'c3.png');
[T4,A4]=gillespie2(k1,k2,n0,'c4.png');
[T5,A5]=gillespie2(k1,k2,n0,'c5.png');
[T6,A6]=gillespie2(k1,k2,n0,'c6.png');
[T7,A7]=gillespie2(k1,k2,n0,'c7.png');
[T8,A8]=gillespie2(k1,k2,n0,'c8.png');
[T9,A9]=gillespie2(k1,k2,n0,'c9.png');
[T10,A10]=gillespie2(k1,k2,n0,'c10.png');
plot(T1,A1,'DisplayName','stochastic process 1');hold on
plot(T2,A2,'DisplayName','stochastic process 2');
plot(T3,A3,'DisplayName','stochastic process 3');
plot(T4,A4,'DisplayName','stochastic process 4');
plot(T5,A5,'DisplayName','stochastic process 5');
plot(T6,A6,'DisplayName','stochastic process 6');
plot(T7,A7,'DisplayName','stochastic process 7');
plot(T8,A8,'DisplayName','stochastic process 8');
plot(T9,A9,'DisplayName','stochastic process 9');
plot(T10,A10,'DisplayName','stochastic process 10');
legend()
ylabel('Number of molecules')
xlabel('Time/s')
hold off
saveas(gcf, 'mean2.png');
function [T,A]=gillespie2(k1,k2,n0,name)
T=linspace(0,100,101);
A=linspace(0,101,101);
t=0;
A(1)=n0;
a=n0;
for i=2:101
    r1=rand;
    r2=rand;
    alpha=a*k1+k2;
    t=t+log(1/r1)/(alpha);
    if r2<k2/alpha
        a=a+1;
    else
        a=a-1;
    end
    A(i)=a;
    T(i)=t;
end
plot(T,A, 'LineWidth', 2,'DisplayName', 'stochastic process');hold on
T2=linspace(0,T(101),1000);
Y=k2/k1+(n0-k2/k1)*exp(-k1*T2);
plot(T2,Y,'r', 'LineWidth', 1,'DisplayName', 'supposed mean');
hold off
legend()
ylabel('Number of molecules')
xlabel('Time/s')
saveas(gcf,name);
end