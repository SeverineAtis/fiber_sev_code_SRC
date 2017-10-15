source = 'D:\DATAS\151118_PIV_100rpm_steady__6Hz\';
F = loadvec([source,'B00100.vc7']);
figure;
showf(F,'ScaleArrow',1000, 'Background', 'rot');
%showf(vec2scal(F,'rot'));
caxis([-2 2]);
colormap 'parula';
%colormap(flipud(colormap));
shading interp;
figure;
showf(F,'ScaleArrow',2000,'Background','off');
%%
Vfield_all = loadvec([source,'*.vc7']);
Vfield_mean = averf(Vfield_all);
figure;
showf(Vfield_mean,'ScaleArrow',2000,'Background','off');

%%
F = PivField;
xc = PivField.x /PIV_parameters.L;   % normalizing xc(mm) by L in mm
yc = PivField.y /PIV_parameters.L;   % normalizing yc(mm) by L in mm/
L_xc = length(xc);
L_yc = length(yc);
x_offset = (max(xc) - min(xc) )/2;
y_offset = (max(yc) - min(yc) )/2;
xc = xc - (max(xc) - x_offset);
yc = yc - (max(yc) - y_offset);

[Xgrid, Ygrid] = meshgrid(xc,yc);

quiver(Xgrid, Ygrid, F.vx', F.vy',5);
set(gca,'DataAspectRatio',[1 1 1]);
axis ([-1.5 1.5 -0.5 0.5]);

%%
F = PivField;
xc = PivField.x; 
yc = PivField.y;
L_xc = length(xc);
L_yc = length(yc);
x_offset = (max(xc) - min(xc) )/2 - 7;
y_offset = (max(yc) - min(yc) )/2;
xc = xc - (max(xc) - x_offset);
yc = yc - (max(yc) - y_offset);
F.x = xc; 
F.y = yc;


figure;
showf(F,'ScaleArrow',1500,'Background','off','Spacing',[3 3],'colorvec','r');
axis ([-150 150 -50 50]);

figure;
showf(F,'ScaleArrow',1500,'Background','rot','Spacing',[3 3], 'CMap', 'parula','colorvec','r');
axis ([-150 150 -50 50]);