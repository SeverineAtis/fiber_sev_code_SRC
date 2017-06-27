function [dUx_dx, dUx_dy, dUy_dx, dUy_dy, rotation] = piv_grad(param, file, l_load_piv_grad, l_save)

  if( l_load_piv_grad )
      
      % Load interpolants from file or ...
      % ==================================
      
      save_obj = matfile(file, 'Writable', false);
      
      varargout{1} = save_obj.dUx0_dx;
      varargout{2} = save_obj.dUx0_dy;
      varargout{3} = save_obj.dUy0_dx;

      
   else

      % ... Compute gradient with cluster method
      % ========================

      fprintf('Computing rotor oscillator analytical function on a grid\n')
      
      % Define grid
      % -----------
      x_range = param.x_range;
      y_range = param.y_range;
      dx      = param.dx     ;
      dy      = param.dy     ;
      dcl     = param.dcl    ;

      x_grid = x_range(1):dx:x_range(2);
      y_grid = y_range(1):dy:y_range(2);

      [XG,YG] = ndgrid(x_grid, y_grid);
      sz_grid = size(XG);
      n_points = numel(XG);
      XG = reshape(XG, n_points, 1);
      YG = reshape(YG, n_points, 1);
      X = [XG ; XG+dcl/2 ; XG       ; XG-dcl/2 ; XG      ];
      Y = [YG ; YG       ; YG+dcl/2 ; YG       ; YG-dcl/2];
      n_points_tot = 5*n_points;


      % dUx0_dx
      field_tmp = ( ux(1*n_points+1:2*n_points) - ux(3*n_points+1:4*n_points) ) / dcl;
      varargout{1} = griddedInterpolant(XG, YG, reshape(field_tmp, sz_grid), 'cubic');
      % dUx0_dy
      field_tmp = ( ux(2*n_points+1:3*n_points) - ux(4*n_points+1:5*n_points) ) / dcl;
      varargout{2} = griddedInterpolant(XG, YG, reshape(field_tmp, sz_grid), 'cubic');
      % dUy0_dx
      field_tmp = ( uy(1*n_points+1:2*n_points) - uy(3*n_points+1:4*n_points) ) / dcl;
      varargout{3} = griddedInterpolant(XG, YG, reshape(field_tmp, sz_grid), 'cubic');
      % dUy0_dy
      field_tmp = ( uy(2*n_points+1:3*n_points) - uy(4*n_points+1:5*n_points) ) / dcl;
      varargout{4} = griddedInterpolant(XG, YG, reshape(field_tmp, sz_grid), 'cubic');
      
      %clear field_tmp ux uy

end