% little animation of a point moving to the right one unit
% and up half a unit
% c. copos (2/21/2023)

Nt = 100;
r = zeros(Nt,2);

vidobj = VideoWriter('test.mp4','mpeg-4');
open(vidobj);

for k=1:Nt
    r(k+1,1) = r(k,1) + 1;
    r(k+1,2) = r(k,2) + 0.5;
    scatter(r(1,1),r(1,2),100,'rd','markerfacecolor','r'); hold on;
    scatter(r(k+1,1),r(k+1,2),50,'ok','markerfacecolor','k');
    xlim([0 100])
    ylim([0 100])
    pbaspect([100 100 1])
    set(gca,'FontSize',20);
    set(gcf,'color','w');
    box on;
    currFrame = getframe(gcf);
    hold off;
    writeVideo(vidobj,currFrame);
end
close(vidobj);

function drdt=myode(t,r,n)%in r and drdt 1-n is the original function,n+1-2n is dirivative
G=1;
m0=1.0;
drdt=zeros(2*n,1);
r2=norm(r(1:n));
for i=1:n
    drdt(i)=r(n+i);
    drdt(n+i)=-G*m0*r(i)/(r2^3);
end
end