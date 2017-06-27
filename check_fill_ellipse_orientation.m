theta = 0
n_points = 20;
color = 'r';
phi = linspace(0,2*pi*(n_points-1)/n_points,n_points);
% 
% xE =  b*cos(theta) * cos(phi) - a * sin(theta) * sin(phi);
% yE =  a*sin(phi) * cos(theta) + b * sin(theta) * cos(phi);

  xE = a*cos(theta) * cos(phi) - b * sin(theta) * sin(phi);
  yE = b*sin(phi) * cos(theta) + a * sin(theta) * cos(phi);

figure;
fill(xE,yE,color, 'LineStyle','none');
set(gca,'DataAspectRatio',[1 1 1]);
