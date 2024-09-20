t=0:0.01:3*pi;
x=sin(2*t);
y=cos(t);
z=t;
plot3(x,y,z,'blue-')
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
title('Plot of domain omega','FontSize',12)
func=@(x)((2*cos(2*x)).^2+(-sin(x)).^2+1).^0.5;
integral(func,0,3*pi)





