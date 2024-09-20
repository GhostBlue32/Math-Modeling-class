walk1=walkf(50,1,0.1);
walk2=walkf(50,10,0.1);
walk3=walkf(50,100,0.1);
walk4=walkf(50,1000,0.1);
figure(1)
scatter(0,0);hold on
spwalk(walk4,'r',15,1);
spwalk(walk3,'g',20,2);
spwalk(walk2,'y',25,3);
spwalk(walk1,'k',30,4);
ylim([0,4])
pbaspect([100 30 1])
hold off
figure(2)
bins3=floor((max(walk3)-min(walk3))/0.2+1);
histogram(walk3,bins3);hold on
x=min(walk3):0.02:max(walk3);
[modeVal, modeFreq] = mode(floor(walk3*10));
y=sqrt(2*pi)*var(walk3)*modeFreq*normpdf(x,0,var(walk3));
plot(x,y);
hold off
figure(3)
bins4=floor((max(walk4)-min(walk4))/0.2+1);
histogram(walk4,bins4);hold on
x=min(walk4):0.02:max(walk4);
[modeVal, modeFreq] = mode(floor(walk4*10));
y=sqrt(2*pi)*var(walk4)*modeFreq*normpdf(x,0,var(walk4));
plot(x,y);
hold off
figure(4)
bins2=floor((max(walk2)-min(walk2))/0.2+1);
histogram(walk2,bins2);


function walks=walkf(nSteps,size,stepSize)
walks=zeros(size,1);
for i=1:size
    steps = stepSize * (2 * randi([0, 1], nSteps, 1) - 1);
    walk = cumsum(steps);
    walks(i)=walk(nSteps);
end
end

function spwalk(walk,col,siz,j)
[m,n]=size(walk);
for i=1:m
    scatter(walk(i),j-1,siz,'ok','markerfacecolor',col);
end
end