source = 'D:\DATAS\151118_PIV_100rpm_steady__6Hz\';
F = loadvec([source,'B00990.vc7']);
showf(F,'ScaleArrow',1000, 'Background', 'rot');
%showf(vec2scal(F,'rot'));
caxis([-2 2]);
colormap 'parula';
%colormap(flipud(colormap));
shading interp;

%%
[Xgrid, Ygrid] = meshgrid(F.x,F.y);
quiver(Xgrid, Ygrid, F.vx', F.vy');