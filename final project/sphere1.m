load topo
worldmap = topo;
lat = -90:0.5:90;
long = -180:0.5:180;
save('worldmap.mat', 'worldmap', 'lat', 'long');