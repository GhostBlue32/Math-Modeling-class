k=2;
deltat=0.001;
n0=1000;
naivess1(k,deltat,n0);
function naivess1(k,deltat,n0)
A=n0;
a=n0;
while a>0
    r=rand;
    if r<a*k*deltat
        a=a-1;
    end
    A=vertcat(A,a);
end
[m,n]=size(A);
x=linspace(deltat,m*deltat,m);
plot(x,A);
end
