function [Ux0, Uy0] = piv_field_interp(param)

source = param.source;

F = GetAdimPiv(source);
xc = F.x;  % inverted X and Y since working with 270 degree roated matrices!!!!!!!
yc = F.y;
ux = F.ux;
uy = F.uy;

% Create interpolants
% -------------------

[XG, YG] = ndgrid(xc, yc);

Ux0 = griddedInterpolant(XG, YG, ux, 'cubic');
Uy0 = griddedInterpolant(XG, YG, uy, 'cubic');
    

end