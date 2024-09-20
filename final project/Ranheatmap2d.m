deltax=5;
deltat=1/12;
deltat2=1/12;
q3=(18*(1/sqrt(10))/(deltax/deltat)+1)/2
q2=(33*(4/5)/(deltax/deltat)+1)/2
q1=(29*(1/sqrt(2))/(deltax/deltat2)+1)/2
qk3=(18*(3/sqrt(10))/(deltax/deltat)+1)/2
qk2=(33*(3/5)/(deltax/deltat)+1)/2
qk1=(29*(1/sqrt(2))/(deltax/deltat2)+1)/2
t1=24;
t2=(4+24+12);
t3=(12+9)+5/6;
figure(1)
walk2d(800,800,24,q1,qk1,deltax,deltat2,578,505,'walk2d1.mp4')
figure(2)
walk2d(1500,1000,40,q2,qk2,deltax,deltat,1080,750,'walk2d2.mp4')
figure(3)
walk2d(1800,800,t3,q3,qk3,deltax,deltat,1173,422,'walk2d3.mp4')
function walk2d(dist,disty,time,q,qy,deltax,deltat,acdistx,acdisty,name)
X=zeros(dist/deltax,1);
X(2)=1;%starting point at dist*0.05
Y=zeros(disty/deltax,1);
Y(2)=1;
steps=time/deltat;
Xold=X;
Yold=Y;
vidobj = VideoWriter(name,'mpeg-4');
open(vidobj);
for i=1:steps
    Xnew=zeros(dist/deltax,1);
    Ynew=zeros(disty/deltax,1);
    for j=2:(dist/deltax-1)
        Xnew(j)=Xold(j)+(1-2*q)*(Xold(j+1)-Xold(j))+0.5*(Xold(j+1)-2*Xold(j)+Xold(j-1));
    end
    for j=2:(disty/deltax-1)
        Ynew(j)=Yold(j)+(1-2*qy)*(Yold(j+1)-Yold(j))+0.5*(Yold(j+1)-2*Yold(j)+Yold(j-1));
    end
    Xold=Xnew;
    Yold=Ynew;
    XYmix=Yold*(Xold');
    [x, y] = meshgrid(linspace(1,dist/deltax,dist/deltax), linspace(1,disty/deltax,disty/deltax));
    [new_x, new_y] = meshgrid(linspace(1,dist/deltax,dist), linspace(1,disty/deltax,disty));
    new_M = interp2(x, y, XYmix, new_x, new_y);
    cmap = jet(256);
    imagesc(new_M);
    colormap(cmap);
    % Plot the matrix using imagesc and the custom colormap
    title(sprintf('Balloon %d (h)', deltat*i));
    pause(0.01);
    currFrame = getframe(gcf);
    writeVideo(vidobj,currFrame);
end
close(vidobj);
% X=linspace(-dist/deltax*0.05,dist-dist/deltax*0.05,dist/deltax);
% plot(X,Xnew);
% ymin =0; % set the desired bottom limit
% ymax = max(Xnew); % get the data maximum for the upper limit
% ylim([ymin, ymax])
end