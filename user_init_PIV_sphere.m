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
PIV_parameters.source = 'D:\DATAS\151118_PIV_100rpm_steady__6Hz\';
PIV_parameters.t_field = 900;               % experimental flow field time step
PIV_parameters.L = 100;                     % characteristic length scale L in mm, here the tank height: (W X h) =(400mm X 100mm)
file = '..\INPUT\PIV_grad_interpolant' ;    % file where piv field gradients interpolant is read or written 
l_save = true;                              % save or not RO interpolant
l_load_piv_grad = false;                    % load or not RO interpolant

% Particle type
% -------------
particle_type  = 'sphere';   % Choose 'fiber' or 'passive'

% Parameters for sphere particles
 sphere_parameters.st  = 0.2 ;     % particle Stokes number

% Parameters for fiber particles
fiber_parameters.eps = 4    ;     % ellipse aspect ratio: epsilon =  b/a
fiber_parameters.St  = 0.2;     % particle Stokes numbers
fiber_parameters.Re  = 1.e-3;     % Reynolds number

% Cauchy Green Tensor
% -------------------
l_Cauchy_Green = false;   % Compute CG tensor if true otherwise only advect particles (no cluster)

% Result file
% -----------
result_file = 'PIV_sphere_St0pt2_longrun';

% Time info
% ---------
t_init = 0;          % Initial time
t_fin = 500;          % Final time
out_period = 1;     % Intermediate state output every out_period time steps
                     % Put negative value for no intermediate output => only initial and final states
DT = 1.e-2;          % RK4 time step

% Initial conditions
% ------------------
% Domain
%PivField = loadvec([PIV_parameters.source,'B',num2str(PIV_parameters.t_field,'%05d'),'.vc7']);
PivField_all =  averf(loadvec([PIV_parameters.source,'*.vc7'])); % mean PIV field over the entire acquisition!

xc = PivField.x /100;
yc = PivField.y /100;
L_xc = length(xc);
L_yc = length(yc);
x_offset = (max(xc) - min(xc) )/2;
y_offset = (max(yc) - min(yc) )/2;
xc = xc - (max(xc) - x_offset);
yc = yc - (max(yc) - y_offset);

x_min = min(xc)  ; x_max = max(xc) ;   % x domain boundaries normalize by L 
y_min = min(yc)  ; y_max = max(yc) ;   % y domain boundaries normalize by L 
dx = (x_max-x_min)/L_xc;
dy = (y_max-y_min)/L_yc;                % Resolution of the particles grid
% Velocity
init_at_rest = true  ;   % if false, start at local fluid velocity
init_coeff   = 1     ;   % start at local fluid velocity x init_coeff
% Cluster size
cluster_size = 1.e-5  ;   % Size of the cluster for computing flow map gradient

PIV_parameters.x_range = [x_min x_max];         % add description here
PIV_parameters.y_range = [y_min y_max];         % add description here
PIV_parameters.dx      = (x_max-x_min)/L_xc;           % add description here
PIV_parameters.dy      = (y_max-y_min)/L_yc;           % add description here
PIV_parameters.dcl     = max([PIV_parameters.dx, PIV_parameters.dy])      ;           % add description here


% Figure info
% -----------
l_plot_ftle = true;
l_export    = false;
format      = 'png';
visibility  = 'on';
resolution  = 340;
ttl         = 'double gyre tracer T=20';