% plot PIV field

% piv flow parameters
PIV_parameters.source = 'D:\DATAS\151118_PIV_100rpm_steady_6Hz_12X12\';
PIV_parameters.L = 100;                     % characteristic length scale L in mm, here the tank height: (W X h) =(400mm X 100mm)
file = '..\INPUT\PIV_grad_interpolant_ADIM_200rpm' ;    % file where piv field gradients interpolant is read or written 
PivField = averf(loadvec([PIV_parameters.source,'*.vc7']));

U = 0.1;%0.005 / 2; % characteristic velocity of the PIV field [U]= m/s
Ux_adim = PivField.vx ./U;
Uy_adim = PivField.vy ./U;

%________________________
% nondimensional space
L = 1;%100; % characteristic length [L]= mm
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
% inverted X and Y since working with 180 degree rotated matrices!!!!!!!
%**********************************************************************

adim_PivField.ux = rot90(Ux_adim,2);
adim_PivField.uy = rot90(Uy_adim,2);
adim_PivField.x = xc;
adim_PivField.y = yc;



PivField.vx = adim_PivField.ux;
PivField.vy = adim_PivField.uy;
PivField.x = adim_PivField.x;
PivField.y = adim_PivField.y;

figure; hold all;
showf(PivField,'ScaleArrow',1000*U);

[XG,YG] = ndgrid(PivField.x,PivField.y);
