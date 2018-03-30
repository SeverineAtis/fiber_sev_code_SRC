% Flow_field
% ----------
flow_field = 'piv';
% flow_field = 'rotor_oscillator';

% double gyre flow parameters
DG_parameters.A = 0.1         ;  % Amplitude of the stream function
DG_parameters.e = 0;%0.25        ;  % Magnitude of the transversal oscillation
DG_parameters.omega = 2*pi/10 ;  % frequency of gyre oscillation

% rotor oscillator generator parameters
RO_generator_parameters.x_range = [-1 1]     ;   % add description here
RO_generator_parameters.y_range = [-2.5 2.5] ;   % add description here
RO_generator_parameters.dx      = 1.e-3      ;   % add description here
RO_generator_parameters.dy      = 1.e-3      ;   % add description here
RO_generator_parameters.dcl     = 1.e-5      ;   % add description here
RO_generator_parameters.a       = 0.003      ;   % add description here
RO_generator_parameters.h       = 0.01       ;   % add description here
RO_generator_parameters.c       = 0.54       ;   % add description here

% rotor oscillator flow parameters
RO_parameters.eps       = 1       ;   % amplitude of oscillation
RO_parameters.omega     = 2*pi    ;   % pulsation of oscillation
RO_parameters.amp_type  = 0       ;   % type of amplitude evolution: 0 => constant ; 1 => sinusoidal ; 2 => square
RO_parameters.amp       = 1       ;   % amplitude of the stream function
RO_parameters.amp_omega = 2*pi/10 ;   % amplitude pulsation
RO_parameters.amp_phi   = 0*pi    ;   % amplitude initial phase

% rotor oscillator generator options
RO_generator_file     = '..\INPUT\RO_interpolant_01' ;  % file where interpolant is read or written 
RO_generator_save     = false ;  % save or not RO interpolant
RO_generator_load     = true  ;  % load or not RO interpolant
RO_generator_parallel = false ;  % Run RO generator in parallel
RO_generator_n_proc   = 16    ;  % Number of workers used in parfor if parallel is true

% piv flow parameters
PIV_parameters.source = 'D:\DATAS\151118_PIV_100rpm_steady_6Hz_12X12\';
%PIV_parameters.t_field = 900;               % experimental flow field time step
PIV_parameters.L = 100;                     % characteristic length scale L in mm, here the tank height: (W X h) =(400mm X 100mm)
file = '..\INPUT\PIV_grad_interpolant_ADIM_200rpm' ;    % file where piv field gradients interpolant is read or written 
l_save = false;                              % save or not RO interpolant
l_load_piv_grad = true;                    % load or not RO interpolant

% Particle type
% -------------
particle_type  = 'fiber';   % Choose 'fiber' or 'passive'

% Parameters for sphere particles
 sphere_parameters.st  = 0.001 ;     % particle Stokes number

% Parameters for fiber particles
fiber_parameters.eps = 5    ;     % ellipse aspect ratio: epsilon =  b/a
fiber_parameters.St  = 0.001;     % particle Stokes numbers

% Cauchy Green Tensor
% -------------------
l_Cauchy_Green = false;   % Compute CG tensor if true otherwise only advect particles (no cluster)

% Result file
% -----------
result_file = 'adimPIV_fiber_St0pt001_200rpm';

% Time info
% ---------
t_init = 0;          % Initial time
t_fin = 100;         % Final time
out_period = 1;     % Intermediate state output every out_period time steps
                     % Put negative value for no intermediate output => only initial and final states
DT = 1.e-3;          % RK4 time step

% Initial conditions
% ------------------
% Domain
F = GetAdimPiv(PIV_parameters.source);
xc = F.x; % inverted X and Y since working with 270 degree rotated matrices!!!!!!!
yc = F.y;
L_xc = length(xc);
L_yc = length(yc);
x_min = min(xc)  ; x_max = max(xc) ;   % nondimensional x domain boundaries
y_min = min(yc)  ; y_max = max(yc) ;   % nondimensional y domain boundaries
dx = (x_max-x_min)/L_xc *2*3;
dy = (y_max-y_min)/L_yc *2*3;                % nondimensional resolution of the particle grid
% Velocity
init_at_rest = true  ;   % if false, start at local fluid velocity
init_coeff   = 1     ;   % start at local fluid velocity x init_coeff
% Cluster size
cluster_size = 1.e-5  ;   % Size of the cluster for computing flow map gradient
%PIV field interpolant parameters
PIV_parameters.x_range = [x_min x_max];         % interpolation domain
PIV_parameters.y_range = [y_min y_max];         
PIV_parameters.dx      = dx;    % interpolation domain resolution = PIV resolution
PIV_parameters.dy      = dy;    
PIV_parameters.dcl     = max([dx, dy]); %interpolant gradient determination scale


% Figure info
% -----------
l_plot_ftle = true;
l_export    = false;
format      = 'png';
visibility  = 'on';
resolution  = 340;
ttl         = 'double gyre tracer T=20';