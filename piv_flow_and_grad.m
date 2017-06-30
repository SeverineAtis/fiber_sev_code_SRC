function [Ux, Uy, DUx_Dt, DUy_Dt, dUx_dx, dUx_dy, dUy_dx, dUy_dy, rotation] = piv_flow_and_grad( t, XY, delta, Ux0, Uy0, dUx0_dx, dUx0_dy, dUy0_dx, dUy0_dy, param)

% parameters


% Positions list
X = XY(:,1);
Y = XY(:,2);

% Velocity and Velocity spatial gradients
Ux     = Ux0    ( X , Y );
Uy     = Uy0    ( X , Y );
dUx_dx = dUx0_dx( X , Y );
dUy_dy = dUy0_dy( X , Y );
dUx_dy = dUx0_dy( X , Y );
dUy_dx = dUy0_dx( X , Y );


% steady experimental flow
DUx_Dt = 0;
DUy_Dt = 0;

% Compute rotation
rotation = 1/2 * ( dUy_dx - dUx_dy );

end