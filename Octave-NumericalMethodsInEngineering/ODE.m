1;
clear
format long
output_precision(16)


[t,y] = meshgrid(0:0.1:1,0:0.2:2);
u = ones(size(t));
dy = t.*y+t.^3;
quiver(t,y,u,dy)