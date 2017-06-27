function F = RHS_fiber(t, State, flow_field, param)
   
   % State is the state vector for all particles:
   % | X         |     | State(:,1) |
   % | Y         |     | State(:,2) |
   % | X_dot     |  =  | State(:,3) |
   % | Y_dot     |     | State(:,4) |
   % | Theta     |     | State(:,5) |
   
   % Decompose State vector (for code readability)
   X     = State(:,1);
   Y     = State(:,2);
   X_dot = State(:,3);
   Y_dot = State(:,4);
   Theta = State(:,5);
      
   % K tensor coefficients
   
   L2 = (param.eps^2 - 1) / ( 2*((2*param.eps^2 - 1)*log(param.eps+sqrt(param.eps^2 - 1))/sqrt(param.eps^2 - 1))  - param.eps) ;
   L1 = (param.eps^2 - 1) / (   ((2*param.eps^2 - 3)*log(param.eps+sqrt(param.eps^2 - 1))/sqrt(param.eps^2 - 1))  + param.eps) ;
   
   %Drag force
   %pre_fact_1 = (8*param.Re)/(3*param.St);
   %pre_fact_1 = 2/3 *1/(6*param.eps*param.St);
   %pre_fact_1 = 2/3  * 8/3 * 1/(param.eps*param.St);
   pre_fact_1 = 2/3 *1/6 * 1/(param.eps*param.St);
   pre_fact_2 = 1/2*(1-param.eps^2)/(1+param.eps^2);
   
   % Flow properties
   [Ux, Uy, DUx_Dt, DUy_Dt, dUx_dx, dUx_dy, dUy_dx, dUy_dy, rotation] = flow_field(t, [X,Y]);
   
   % Right Hand Side
   COS = cos(Theta);
   SIN = sin(Theta);
   
   
   F(:,1) = X_dot;
   F(:,2) = Y_dot;
   F(:,3) = DUx_Dt - pre_fact_1 * ( L1*cos(Theta).* (X_dot- Ux)  - L2*sin(Theta).* (Y_dot- Uy) );
   F(:,4) = DUy_Dt - pre_fact_1 * ( L2*cos(Theta).* (Y_dot- Uy)  + L1*sin(Theta).* (X_dot- Ux) );
   F(:,5) = rotation + pre_fact_2 * ( sin(2*Theta).*(dUx_dx-dUy_dy) - cos(2*Theta).*(dUy_dx+dUx_dy) );
      
end