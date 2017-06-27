



% x,y         vectors containing the X and Y coordinates
% vx,vy (vz)  matrices of the x, y (and z) components of the velocity
% ysign      string, upward or downward Y axis
% namevx, unitvx, namex, unitx...   strings
%     name        name of the VEC/VC7 file from which originates V
% setname     name of the parent directory (called 'SET' in DaVis)
% Attributes  Additional informations from DaVis (see getattribute)
% choice      An array of 6 integers, giving the 1st, 2nd, 3rd, 4th
% choice vectors, the number of filled/processed vectors
% and the number of missing vectors.
% history     Remind from which command V has been obtained


time = 1
deltat = 15
Xp = X(:,:,:);
Yp = Y(:,:,:);
Ux = Xp(:,:,time+deltat) - Xp(:,:,time);
Uy = Yp(:,:,time+deltat) - Yp(:,:,time);

F.x = Y(:,1,1)';
F.y = X(1,:,1);
F.vx = rot90(Uy,1)';
F.vy = -rot90(Ux,1)';
F.ysign = 'Y axis upward';
F.namevx = 'Ux';
F.unitvx = 'SI';
F.namex = 'x';
F.unitx = 'SI';
F.namevy = 'Uxy';
F.unitvy = 'SI';
F.namey = 'y';
F.unity = 'SI';
F.name = 'void';
F.setname = 'SET';
F.history = {'severine'};



F_filter = filterf(F,0.02);


[xx, yy] = meshgrid (F_filter.x, F_filter.y);
[omega, utheta] = curl(xx ,yy, F_filter.vx' ,F_filter.vy');
pcolor(xx,yy,omega);
shading interp;

%showf(filterf(F,2),'Spacing',14,'ScaleArrow',1, 'Background', 'rot','r');
%showf(filterf(F,0.02),'ScaleArrow',10, 'Background', 'rot');
showf(F,'ScaleArrow',1000, 'Background', 'rot');
%showf(vec2scal(F,'rot'));
caxis([-2 2]);
colormap 'parula';
%colormap(flipud(colormap));
shading interp;

