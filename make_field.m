



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


F.x = X(1,:,1);
F.y = Y(:,1,1)';
F.vx = Ux';
F.vy = Uy';
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

showf(filterf(F,0.02),'ScaleArrow',5, 'Background', 'rot');
%showf(vec2scal(F,'rot'));
caxis([-1 1]);
colormap 'parula';


%%
F = PivField;

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

U = 0.005; % characteristic velocity of the PIV field [U]= m/s
Ux_adim = F.vx ./U;
Uy_adim = F.vy ./U;

%________________________
% nondimensional space
L = 110; % characteristic length [L]= mm
x_adim = F.x /L;  % normalizing x(mm) by L(mm)
y_adim = F.y /L;

%________________________
% recenter PIV field
x_offset = -7/L; % the PIV field is not centered
y_offset = 0;

x_center = (max(x_adim) - min(x_adim) )/2; % find the center of the x axis
y_center = (max(y_adim) - min(y_adim) )/2;

xc = x_adim - (max(x_adim) - x_center) + x_offset;
yc = y_adim - (max(y_adim) - y_center) + y_offset;


F.vx = Ux_adim;
F.vy = - Uy_adim;
F.x = xc;
F.y = -yc;

figure;
showf(F,'ScaleArrow',0.000005);
%showf(vec2scal(F,'rot'));
colormap 'parula';
axis ([-1.5 1.5 -0.5 0.5]);
caxis([0 2]);
%%
figure; hold all;
showf(F,'ScaleArrow',0.05,'Background', 'off');
%showf(vec2scal(F,'rot'));
colormap 'parula';
axis ([-1.5 1.5 -0.5 0.5]);
caxis([0 2]);
%%
%% PTV 160830 eps = 4 

L = 80;  % tank width in mm L = 100mm
dx = 402/976/L;
x_offset = 149/L; % x offset en mm
y_offset = 47/L;	% y offset en mm

traj_init = 0;

figure; hold all
for i = 1:1:Ntraj
    
    traj_length = size(tracks(tracks(:,4)==i),1);
    traj_i = tracks(traj_init+1 : traj_init+traj_length,1:2);
    plot(traj_i(:,1)*dx - x_offset, traj_i(:,2)*dx - y_offset,'o','MarkerEdgeColor',[0 1 1],'MarkerFaceColor',[0.2 0.4 1],'MarkerSize', 1);
    %plot(traj_i(:,1)*dx - x_offset, traj_i(:,2)*dx - y_offset,'LineWidth',1,'Color',[0.2 0.4 1]);
    
    traj_i = [];
    traj_init = traj_init+traj_length;
    
end

set(gca,'DataAspectRatio',[1 1 1])
axis ([-1.5 1.5 -0.5 0.5]);

