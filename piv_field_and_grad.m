function [Ux, Uy, DUx_Dt, DUy_Dt, dUx_dx, dUx_dy, dUy_dx, dUy_dy, rotation] = piv_field_and_grad( t, XY, delta, param )

% parameters
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

DUx_Dt = 0;
DUy_Dt = 0;

dUx_dx = 0;
dUx_dy = 0;
dUy_dx =0;
dUy_dy =0;
rotation = 0;

end