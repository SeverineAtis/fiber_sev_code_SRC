param.eps=(1.01 : 0.1: 50);
L2 = (param.eps.^2 - 1) ./ ( 2*((2*param.eps.^2 - 1).*log(param.eps+sqrt(param.eps.^2 - 1))./sqrt(param.eps.^2 - 1))  - param.eps) ;
L1 = (param.eps.^2 - 1) ./ (   ((2*param.eps.^2 - 3).*log(param.eps+sqrt(param.eps.^2 - 1))./sqrt(param.eps.^2 - 1))  + param.eps) ;

figure; hold all;
plot(param.eps, L1,'b');
plot(param.eps, L2,'r');

%______________________

%%
epsilon = 2
L1 = (epsilon^2 - 1) / ( 2*((2*epsilon^2 - 1)*log(epsilon+sqrt(epsilon^2 - 1))/sqrt(epsilon^2 - 1))  - epsilon) ;
L2 = (epsilon^2 - 1) / (   ((2*epsilon^2 - 3)*log(epsilon+sqrt(epsilon^2 - 1))/sqrt(epsilon^2 - 1))  + epsilon) ;

th = (0:0.01:2*pi);
COS = cos(th);
SIN = sin(th);
COS_2   = COS .* COS;
SIN_2   = SIN .* SIN;
COS_SIN = (L1 - L2) * COS .* SIN;
clear COS SIN


Cx = L1*COS_2 + L2*SIN_2;
Cy = L1*SIN_2 + L2*COS_2;
Cxy = COS_SIN;

figure; hold all;
plot(th./pi,Cx);
plot(th./pi,Cy);
plot(th./pi,Cxy);

%______________________

%%


L1 = 1/2* (epsilon^2 - 1) / ( (2*epsilon^2 - 1)/sqrt(epsilon^2 - 1) *log(epsilon+sqrt(epsilon^2 - 1))  - epsilon) ;
L2 =      (epsilon^2 - 1) / ( (2*epsilon^2 - 3)/sqrt(epsilon^2 - 1) *log(epsilon+sqrt(epsilon^2 - 1))  + epsilon) ;

th = (0:0.01:2*pi);
COS = cos(th);
SIN = sin(th);
COS_2   = COS .* COS;
SIN_2   = SIN .* SIN;
COS_SIN = (L1 - L2) * COS .* SIN;
clear COS SIN


Cx = L1*COS_2 + L2*SIN_2;
Cy = L1*SIN_2 + L2*COS_2;
Cxy = COS_SIN;


%figure; hold all;
plot(th./pi,Cx,'b');
plot(th./pi,Cy,'r');
plot(th./pi,Cxy,'g');

%______________________

%%
epsilon = 2
L2 = (epsilon^2 - 1) / ( 2*((2*epsilon^2 - 1)*log(epsilon+sqrt(epsilon^2 - 1))/sqrt(epsilon^2 - 1))  - epsilon) ;
L1 = (epsilon^2 - 1) / (   ((2*epsilon^2 - 3)*log(epsilon+sqrt(epsilon^2 - 1))/sqrt(epsilon^2 - 1))  + epsilon) ;

th = (0:0.01:2*pi);
COS = cos(th);
SIN = sin(th);


th = (0:0.01:2*pi);
Cx = L1*COS;
Cy = L2*COS;

%figure; hold all;
plot(th./pi,Cx,'b');
plot(th./pi,Cy,'m');
plot(th./pi,Cxy,'g');

