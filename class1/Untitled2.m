opts = odeset('RelTol',1e-3,'AbsTol',1e-4);%setting tolerence
[T1,X1] = ode45(@func, [0,20], 1);%solve the function,(function,interval to solve,initial value,
[T2,X2] = ode113(@func, [0,20], 1);
[T3,X3] = ode23s(@func, [0,20], 1);
[T4,X4] = ode15s(@func, [0,20], 1);
plot(T1,X1(:,1),'-r','DisplayName',"ode45");
hold on
plot(T2,X2(:,1),'-b','DisplayName',"ode113");
plot(T3,X3(:,1),'-y','DisplayName',"ode23s");
plot(T4,X4(:,1),'-b','DisplayName',"ode15s");
legend()
hold off



function dx=func(t,x)
dx=cos(1001*t);
end

