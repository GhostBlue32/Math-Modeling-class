deltax=5;
deltat=1/12;
q3=(18/(deltax/deltat)+1)/2;
q2=(33/(deltax/deltat)+1)/2
q1=((708/24)/(deltax/deltat)+1)/2
t1=24;
t2=(4+24+12);
t3=(12+9)+5/6;
% figure(1)
% walk1d(4000,24,q2,deltax,deltat,708);
figure(2)
walk1d(4000,t2,q2,deltax,deltat,1359);
% figure(3)
% walk1d(4000,t3,q3,deltax,deltat);
function walk1d(dist,time,q,deltax,deltat,act_x)
X=zeros(dist/deltax,1);
k=0.5;
X(dist/deltax*k)=1/2;%starting point at dist*0.05
X(dist/deltax*k-1)=1/4;
X(dist/deltax*k+1)=1/4;
steps=time/deltat;
Xold=X;
for i=1:steps
    Xnew=zeros(dist/deltax,1);
    for j=2:(dist/deltax-1)
        Xnew(j)=Xold(j)+(1-2*q)*0.5*(Xold(j+1)-Xold(j-1))+0.5*(Xold(j+1)-2*Xold(j)+Xold(j-1));
    end
    Xold=Xnew;
end
X=linspace(0,dist,dist/deltax);
T=linspace(0,time,time/deltat);
sol = pdepe(0,@pdefun,@ic,@bc,X,T);
X=linspace(-dist*k,dist-dist*k,dist/deltax);


 % Calculate confidence interval
[maxval, maxidx] = max(Xnew);
[d95,u95]=found95(Xnew,maxidx);   
plot(X,sol(time/deltat,:,1)/sum(sol(time/deltat,:,1)),'linewidth',1,'DisplayName','pdebesol');hold on
plot(X,Xnew/sum(Xnew),'linewidth',2,'DisplayName','Simulate solution');
fprintf('The maximum point is %f at index %d\n', X(maxidx), maxidx);
fprintf('The 95%% confidence interval is (%f, %f)\n', X(d95), X(u95));
ymin =0; % set the desired bottom limit
ymax = max(max(Xnew),max(sol(time/deltat,:,1))); % get the data maximum for the upper limit
xlim([600,1800])
ylim([ymin, ymax])
line([act_x-3,act_x+3],[ymin,ymax],'Color','green','DisplayName','Actual position');
legend();
hold off;
end

function [d95,u95]=found95(X,peak)
prob=X(peak);
peakm=peak;
peakp=peak;
while prob<0.95
    peakm=peakm+1;
    peakp=peakp-1;
    prob=prob+X(peakm)+X(peakp);
end
d95=peakp;
u95=peakm;
end

function [c,f,s] = pdefun(x,t,u,DuDx)
deltax=5;
deltat=1/12;%change
wspeed=33;%change
q=(wspeed/(deltax/deltat)+1)/2;
a=(1-2*q)*deltax/deltat;
D=0.5*deltax^2/deltat;
c = 1;
f = a*u + D*DuDx;
s = 0;
end

function u0 = ic(x)
sigma=2.7;
u0=1/(sqrt(2*pi)*sigma)*exp(-(x-2000)^2/(2*sigma^2));%change
end



function [pl,ql,pr,qr] = bc(xl,ul,xr,ur,t)
pl = ul;
ql = 0;
pr = ur; % Set value to 0
qr = 0;
end