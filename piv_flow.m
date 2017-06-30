function [Ux, Uy] = piv_flow( t, XY, delta, Ux0, Uy0, param )

Ux = Ux0( XY(:,1),XY(:,2) ); 
Uy = Uy0( XY(:,1),XY(:,2) );    

end