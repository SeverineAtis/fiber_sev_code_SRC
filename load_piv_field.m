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
[Xgrid, Ygrid] = meshgrid(F.x,F.y);
quiver(Xgrid, Ygrid, F.vx', F.vy');
set(gca,'DataAspectRatio',[1 1 1]);
%%
figure
showf(F,'ScaleArrow',2000,'Background','off')