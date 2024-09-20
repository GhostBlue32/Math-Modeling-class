k=2;
deltat=0.01;
n0=100;
T1=gillespie(k,deltat,n0,'b1.png');
T2=gillespie(k,deltat,n0,'b2.png');
T3=gillespie(k,deltat,n0,'b3.png');
T4=gillespie(k,deltat,n0,'b4.png');
T5=gillespie(k,deltat,n0,'b5.png');
T6=gillespie(k,deltat,n0,'b6.png');
T7=gillespie(k,deltat,n0,'b7.png');
T8=gillespie(k,deltat,n0,'b8.png');
T9=gillespie(k,deltat,n0,'b9.png');
T10=gillespie(k,deltat,n0,'b10.png');
x=linspace(n0,0,n0+1);
plot(T1,x,'DisplayName','stochastic process 1');hold on
plot(T2,x,'DisplayName','stochastic process 2');
plot(T3,x,'DisplayName','stochastic process 3');
plot(T4,x,'DisplayName','stochastic process 4');
plot(T5,x,'DisplayName','stochastic process 5');
plot(T6,x,'DisplayName','stochastic process 6');
plot(T7,x,'DisplayName','stochastic process 7');
plot(T8,x,'DisplayName','stochastic process 8');
plot(T9,x,'DisplayName','stochastic process 9');
plot(T10,x,'DisplayName','stochastic process 10');
legend()
ylabel('Number of molecules')
xlabel('Time/s')
hold off
saveas(gcf, 'mean1.png');
function T=gillespie(k,deltat,n0,name)
T=linspace(0,n0,n0+1);
t=0;
a=n0;
for i=2:n0+1
    r=rand;
    t=t+log(1/r)/(a*k);
    a=a-1;
    T(i)=t;
end
x=linspace(n0,0,n0+1);
plot(T,x, 'LineWidth', 2,'DisplayName', 'stochastic process');hold on
T2=linspace(0,T(n0+1),1000);
Y=n0*exp(-k*T2);
plot(T2,Y,'r', 'LineWidth', 1,'DisplayName', 'supposed mean');
hold off
legend()
ylabel('Number of molecules')
xlabel('Time/s')
saveas(gcf, name);
end
