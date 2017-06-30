function [Ux, Uy, DUx_Dt, DUy_Dt, dUx_dx, dUx_dy, dUy_dx, dUy_dy, rotation] = piv_flow( t, XY, delta, Ux0, Uy0, param )

Ux = Ux0( XY(:,1),XY(:,2) ); 
Uy = Uy0( XY(:,1),XY(:,2) );

DUx_Dt=0;
DUy_Dt=0;
dUx_dx=0;
dUx_dy=0;
dUy_dx=0;
dUy_dy=0;
rotation=0;

end