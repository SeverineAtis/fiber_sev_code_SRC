source = 'D:\DATAS\151118_PIV_100rpm_steady_6Hz_12X12\';
F = GetAdimPiv(source);
xc = F.x;  % inverted X and Y since working with 270 degree rotated matrices!!!!!!!
yc = F.y;
ux = F.ux;
uy = F.uy;

% Create interpolants
% -------------------clear all


[XG, YG] = ndgrid(xc, yc);
Ux0 = griddedInterpolant(XG, YG, ux, 'cubic');
Uy0 = griddedInterpolant(XG, YG, uy, 'cubic');

sz_grid = size(XG);
n_points = numel(XG);
X = reshape(XG, n_points, 1);
Y = reshape(YG, n_points, 1);
ux_pts = Ux0(X,Y);
uy_pts = Uy0(X,Y);
ux_array = reshape(ux_pts, sz_grid);
uy_array = reshape(uy_pts, sz_grid);
imagesc(yc,xc,uy_array)

