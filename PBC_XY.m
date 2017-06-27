function [State_cur] = PBC_XY (State_cur, DX, DY )


% State is the state vector for all particles:
% | X |      | State(:,1) |
% |   |  =   |            |
% | Y |      | State(:,2) |

X = State_cur(:,1);
Y = State_cur(:,2);
L = DX(2) - DX(1);
H = DY(2) - DY(1);

X(X <  DX(1)) = X(X <  DX(1)) + L;
Y(Y <  DY(1)) = Y(Y <  DY(1)) + H;

X(X >  DX(2)) = X(X >=  DX(2)) - L;
Y(Y >  DY(2)) = Y(Y >=  DY(2)) - H;


State_cur(:,1) = X;
State_cur(:,2) = Y;


end