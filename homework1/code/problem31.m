Sp=zeros(30,1,'single');
Dp=zeros(30,1);
Spe=zeros(30,1,'single');
Dpe=zeros(30,1);
ts=single(1/(sqrt(3)));
td=1/sqrt(3);
Sp(1)=ts;
Spe(1)=abs(single(pi)-ts);
Dp(1)=td;
Dpe(1)=abs(pi-td);
for i=2:30
    ts=(calt(ts));
    Sp(i)=ts*6*(2^(i-1));
    Spe(i)=abs((pi)-ts*6*(2^(i-1)));
    td=calt(td);
    Dp(i)=td*6*(2^(i-1));
    Dpe(i)=abs(pi-td*6*(2^(i-1)));
end
Sp
Spe
Dp
Dpe
x=zeros(30);
for i=1:30
    x(i)=i;
end
plot(x,Spe,x,Dpe)
title('Absolute error as number of iteration grows')
ylabel('Precision error')
xlabel('number of iteration')
legend('Single precision error','double precision error')
function x=calt(t)
x=t/(sqrt(t^2+1)+1);
end
