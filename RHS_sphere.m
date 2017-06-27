function F = RHS_sphere(t, State, flow_field, param)
   
   % State is the state vector for all particles:
   % | X         |     | State(:,1) |
   % | Y         |     | State(:,2) |
   % | X_dot     |  =  | State(:,3) |
   % | Y_dot     |     | State(:,4) |
   
   St = param.st;
   
   % Decompose State vector (for code readability)
   X     = State(:,1);
   Y     = State(:,2);
   X_dot = State(:,3);
   Y_dot = State(:,4);
      
   
   % Flow properties
   [Ux, Uy, DUx_Dt, DUy_Dt, dUx_dx, dUx_dy, dUy_dx, dUy_dy, rotation] = flow_field(t, [X,Y]);
   

   F(:,1) = X_dot;
   F(:,2) = Y_dot;
   F(:,3) = DUx_Dt -2/(3*St)*(X_dot - Ux);
   F(:,4) = DUy_Dt -2/(3*St)*(Y_dot - Uy);
   
end
