clear;
close all;
clc;

opts = odeset('RelTol',1e-3,'AbsTol',[1e-4 1e-4]);%setting tolerence
[T,Y] = ode45(@fxn_rigid, [0,20], [30,4], opts);%solve the function,(function,interval to solve,initial value,

plot(T,Y(:,1),'o-r',T,Y(:,2),'s-k');
xlabel('t'); ylabel('y'); 
title('RelTol=1e-3');
set(gca,'fontsize',20);
set(gcf,'color','w');
legend('preditor','pray')
hold on 
load('harelynx_data.mat');
plot(t,hares_inthousands,'-ok');
plot(t,lynx_inthousands,'-ok');

function dy = fxn_rigid(t,y)
a=0.48;
b=0.025;
c=0.93;
d=0.028;
dy = zeros(2,1);
dy(1)=a*y(1)-b*y(1)*y(2);
dy(2)=-c*y(2)+b*y(1)*y(2);
end
