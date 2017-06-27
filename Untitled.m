% xtest = linspace(min(PivField.x),max(PivField.x),1037);
% ytest = linspace(min(PivField.y),max(PivField.y),1037);
Ux_test = Ux0_interpObj(XG, YG );
% Ux_testGrid = reshape (Ux_test, [61,17]);
% imagesc(Ux_testGrid)


%%
param = PIV_parameters

% Positions
% ---------
% Initial particle positions
X_0 = x_min+dx:dx:x_max-dx;
Y_0 = y_min+dy:dy:y_max-dy;
[X_0, Y_0] = meshgrid(X_0, Y_0);
sz_ini = size(X_0);   % Store size for later use

n_part = numel(X_0);
sz = [n_part, 1];
X_0 = reshape(X_0, sz);
Y_0 = reshape(Y_0, sz);

XY = [X_0, Y_0];

t_field = param.t_field; % PIV field picture number
source = param.source;
L = param.L; % characteristic length scale L

PivField = loadvec([source,'B',num2str(t_field,'%05d'),'.vc7']);
Ux_array = PivField.vx *1000/L; % converting v(m/s) to (mm/s) and normalizing by L(mm)
Uy_array = PivField.vy *1000/L;

% recenter and normalize experimental coordinates
% -------------------

xc = PivField.x /100;  % normalizing x(mm) by L(mm)
yc = PivField.y /100;

x_offset = (max(xc) - min(xc) )/2;
y_offset = (max(yc) - min(yc) )/2;

xc = xc - (max(xc) - x_offset);
yc = yc - (max(yc) - y_offset);

% Create interpolants
% -------------------

[XG, YG] = ndgrid(xc, yc);

Ux0_interpObj = griddedInterpolant(XG, YG, Ux_array, 'cubic');
Uy0_interpObj = griddedInterpolant(XG, YG, Uy_array, 'cubic');


Ux = Ux0_interpObj( XY(:,1),XY(:,2) ); 
Uy = Uy0_interpObj( XY(:,1),XY(:,2) );


Ux_test = reshape( Ux(1:n_part,1,:), sz_ini );
Uy_test = reshape( Uy(1:n_part,1,:), sz_ini );

imagesc(Ux_test)
 