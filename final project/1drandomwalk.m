deltax=5;
deltat=1/6;
deltat2=1/8;
q3=(18/(deltax/deltat)+1)/2;
q2=(21.6/(deltax/deltat)+1)/2;
q1=(25.2/(deltax/deltat2)+1)/2;
t1=24;
t2=(4+24+12);
t3=(12+9);
x1 = zeros(10,t1/deltat2);
x2 = zeros(10,t2/deltat);
x3 = zeros(10,t3/deltat);
for i = 1:10
    x1(i,10) = 0;
    x2(i,10) = 0;
    x3(i,10) = 0;
end

for j = 1 : 10
    for i = 2 : t1/deltat
        p = rand();
        if (p < q1)
            x1(j,i) = x1(j,i-1) + deltax;
        else
            x1(j,i) = x1(j,i-1) - deltax;
        end
    end
end

for j = 1 : 10
    for i = 2 : t2/deltat
        p = rand();
        if (p < q1)
            x2(j,i) = x2(j,i-1) + deltax;
        else
            x2(j,i) = x2(j,i-1) - deltax;
        end
    end
end

for j = 1 : 10
    for i = 2 : t3/deltat
        p = rand();
        if (p < q1)
            x3(j,i) = x3(j,i-1) + deltax;
        else
            x3(j,i) = x3(j,i-1) - deltax;
        end
    end
end
T1 = (1:t1/deltat) * deltat;
T2 = (1:t2/deltat) * deltat;
T3 = (1:t3/deltat) * deltat;

figure(1)
plot(T1, x1')
xlabel('Time (mins)')
ylabel('Position (km)')
title('Random Walk Simulation Results')

figure(2)
plot(T2, x2')
xlabel('Time (mins)')
ylabel('Position (km)')
title('Random Walk Simulation Results')

figure(3)
plot(T3, x3')
xlabel('Time (mins)')
ylabel('Position (km)')
title('Random Walk Simulation Results')