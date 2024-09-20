nSteps = 50;
startPos = 0;
stepSize = 0.1;
steps = stepSize * (2 * randi([0, 1], nSteps, 1) - 1);
walk = cumsum(steps) + startPos;
plot(walk);
k=5;
vidobj = VideoWriter('test.mp4','mpeg-4');
open(vidobj);
for i=1:nSteps*k-1
    scatter(walk(floor(i/k)+1),0,50,'ok','markerfacecolor','r')
    xlim([min(walk) max(walk)])
    ylim([0 0.5])
    pbaspect([100 30 1])
    title('Random walk')
    currFrame = getframe(gcf);
    writeVideo(vidobj,currFrame);
end
close(vidobj);