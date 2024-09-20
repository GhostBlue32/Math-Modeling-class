Sp=zeros(10,1,'single');
Dp=zeros(10,1);
Spe=zeros(10,1,'single');
Dpe=zeros(10,1);
xs=single(pi/4);
xd=double(pi/4);
rea=-sqrt(2)/2;
for i=1:10
    ts=func(single(pi/4),i);
    Sp(i)=ts;
    Spe(i)=abs(rea-ts);
    td=func(pi/4,i);
    Dp(i)=td;
    Dpe(i)=abs(rea-td);
end
Sp
Spe
Dp
Dpe
x=zeros(10);
for i=1:10
    x(i)=i;
end
plot(x,Spe,x,Dpe)
title('Absolute error as number of iteration grows')
ylabel('Precision error')
xlabel('Size of h')
legend('Single precision error','double precision error')


function y=func(x,i)
y=(sin(x+2^(-i))-2*sin(x)+sin(x-2^(-i)))/(2^(-2*i));
end


