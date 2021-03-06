function [adim_PivField] = GetAdimPiv(source)

PivField = averf(loadvec([source,'*.vc7'])); % mean PIV field over the entire acquisition!

%%%%%%%%%%%%%%%%%%%%%%
% [PivField.vx] = m/s
% [PivField.vy] = m/s
% [PivField.x]  = mm 
% [PivField.y]  = mm
%%%%%%%%%%%%%%%%%%%%%%

%________________________
% nondimensional velocity
U = 0.005 / 2; % characteristic velocity of the PIV field [U]= m/s
% multiplied by 2: 100rpm (PIV rotation) -> 200rpm (experiments with particles)
Ux_adim = PivField.vx ./U;
Uy_adim = PivField.vy ./U;

%________________________
% nondimensional space
L = 100; % characteristic length [L]= mm
x_adim = PivField.x /L;  % normalizing x(mm) by L(mm)
y_adim = PivField.y /L;

%________________________
% recenter PIV field
x_offset = 7/L; % the PIV field is not centered
y_offset = 0;

x_center = (max(x_adim) - min(x_adim) )/2; % find the center of the x axis
y_center = (max(y_adim) - min(y_adim) )/2;

xc = x_adim - (max(x_adim) - x_center) + x_offset;
yc = y_adim - (max(y_adim) - y_center) + y_offset;

%**********************************************************************
% inverted X and Y since working with 270 degree rotated matrices!!!!!!!
%**********************************************************************
adim_PivField.ux = rot90(Uy_adim,3);
adim_PivField.uy = - rot90(Ux_adim,3);
adim_PivField.x = yc;
adim_PivField.y = xc;

end

