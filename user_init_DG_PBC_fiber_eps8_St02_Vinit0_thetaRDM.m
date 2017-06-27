 % Flow_field
% ----------
 flow_field = 'double_gyre';
% flow_field = 'rotor_oscillator';

% double gyre flow parameters
DG_parameters.A = 0.1         ;  % Amplitude of the stream function
DG_parameters.e = 0;%0.25        ;  % Magnitude of the transversal oscillation
DG_parameters.omega = 2*pi/10 ;  % frequency of gyre oscillation

% rotor oscillator generator parameters
RO_generator_parameters.x_range = [-1 1]     ;   % add description here
RO_generator_parameters.y_range = [-2.5 2.5] ;   % add description here
RO_generator_parameters.dx      = 1.e-2      ;   % add description here
RO_generator_parameters.dy      = 1.e-2      ;   % add description here
RO_generator_parameters.dcl     = 1.e-3      ;   % add description here
RO_generator_parameters.a       = 0.003      ;   % add description here
RO_generator_parameters.h       = 0.01       ;   % add description here
RO_generator_parameters.c       = 0.54       ;   % add description here

% rotor oscillator flow parameters
RO_parameters.eps       = 0       ;   % amplitude of oscillation
RO_parameters.omega     = 0.1*pi    ;   % pulsation of oscillation
RO_parameters.amp_type  = 0       ;   % type of amplitude evolution: 0 => constant ; 1 => sinusoidal ; 2 => square
RO_parameters.amp       = 1       ;   % amplitude of the stream function
RO_parameters.amp_omega = 2*pi/10 ;   % amplitude pulsation
RO_parameters.amp_phi   = 0*pi    ;   % amplitude initial phase

% rotor oscillator generator options
RO_generator_file   = '../INPUT/RO_interpolant_01' ;  % file where interpolant is read or written 
RO_generator_save   = false  ;  % save or not RO interpolant
RO_generator_load   = true   ;  % load or not RO interpolant
RO_generator_parallel = false ;  % Run RO generator in parallel
RO_generator_n_proc   = 16    ;  % Number of workers used in parfor if parallel is true


% Particle type
% -------------
 particle_type  = 'fiber';   % Choose 'fiber' or 'passive'
% Parameters for fiber particles
fiber_parameters.eps = 8    ;     % ellipse aspect ratio: epsilon =  b/a
fiber_parameters.St  = 0.2;     % particle Stokes number
%fiber_parameters.Re  = 1.e-3;     % Reynolds number

% Cauchy Green Tensor
% -------------------
l_Cauchy_Green = false;   % Compute CG tensor if true otherwise only advect particles (no cluster)

% Result file
% -----------
%result_file = 'RO_flow_eps0_lambda01pi_TEST';
%result_file = 'RO_fiber_V_U_th_0_T_20_St003_eps4_steadyflow_TEST_1e3';
result_file = 'DG_PBC_fiber_eps8_St02_thetaRDM_Vinit0';
%result_file = 'doublegyre_passive_T40';

% Time info
% ---------
t_init = 0;          % Initial time
t_fin = 20;          % Final time
out_period = -1;     % Intermediate state output every out_period time steps
                     %    Put negative value for no intermediate output => only initial and final states
DT = 1.e-2;          % RK4 time step

% Initial conditions
% ------------------
% Domain
%x_min = -1  ; x_max = 1 ;   % x domain boundaries
%y_min = -2.5  ; y_max = 2.5 ;   % y domain boundaries
x_min = 0  ; x_max = 2 ;   % x domain boundaries
y_min = 0  ; y_max = 2 ;   % y domain boundaries

dx = 0.01  ; dy = 0.01 ;   % Resolution
% Velocity
init_at_rest = true  ;   % if false, start at local fluid velocity
init_coeff   = 1     ;   % start at local fluid velocity x init_coeff
% Cluster size
cluster_size = 1.e-5  ;   % Size of the cluster for computing flow map gradient

% Figure info
% -----------
l_plot_ftle = true;
l_export    = true;
format      = 'fig';
visibility  = 'on';
resolution  = 340;
%ttl         = 'RO flow eps= 0 lambda= 0.1\pi TEST';
%ttl         = 'fiber V=U theta = 0 T=20 St003 eps4 steadyflow TEST 1e-3';
ttl         = 'doublegyre PBC fiber eps=8 St=0.2 theta=RDM T=20';
%ttl         = 'doublegyre flow T=40';
