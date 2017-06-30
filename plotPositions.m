
Xsph = X;
Ysph = Y;

[Ltrac Ctrac] = size(X(:,:,1));

% Xtrac = X;
% Ytrac = Y;
% 
% [Ltrac Ctrac] = size(X(:,:,1));


t = size(Xsph,3); 


%figure; hold all;
for t = t;%1 : 20 : size(Xsph,3)
plot(Xsph(1:1:Ltrac,1:1:Ctrac,t),Ysph(1:1:Ltrac,1:1:Ctrac,t), 'om', 'MarkerSize', 1.5);%, 'MarkerFaceColor', 'k');
set(gca,'DataAspectRatio',[1 1 1])  
%axis ([0 1 0 1]);  
end
%%
t = size(Xtrac,3); 

plot(Xtrac(1:1:Ltrac,1:1:Ctrac,t),Ytrac(1:1:Ltrac,1:1:Ctrac,t), 'or', 'MarkerSize', 1);%, 'MarkerFaceColor', 'k');
%set(gca,'Color',[0 0 0]);
%axis ([0 1 0 1]);  
%%
figure; hold on;

for xp = 1:20:199
for yp = 1:20:199



[Ltrac Ctrac] = size(X(:,:,1));


%plot(Xtrac(1:1:Ltrac,1:1:Ctrac,t),Ytrac(1:1:Ltrac,1:1:Ctrac,t),'-o', 'MarkerSize', 1.5, 'MarkerFaceColor', 'k');

for t=1:2001; Bx(t) = Xtrac(xp,yp,t); end 
for t=1:2001; By(t) = Ytrac(xp,yp,t); end

for t=1:2001; Ax(t) = Xsph(xp,yp,t); end 
for t=1:2001; Ay(t) = Ysph(xp,yp,t); end

plot(Ax,Ay,'-r');
plot(Bx,By,'-k');

set(gca,'DataAspectRatio',[1 1 1])
%set(gca,'Color',[0 0 0]);
%axis ([0 1 0 1]);    

end
end



%%
t = size(X,3); 
Xelli = X;
Yelli = Y;
%[Lelli Celli] = size(X(:,:,t));
% Lelli = 99;
% Celli = 99;

a = 0.0013;
b = 0.009;

figure; hold on;
fill_ellipses(Xelli(:,:,1:50:t),Yelli(:,:,1:50:t),a ,b , Theta(:,:,1:50:t), 5, 'r');
set(gca,'DataAspectRatio',[1 1 1]);
%set(gca,'Color',[0 0 0]);
%axis ([0 1 0 1]);   

%%

FTLE = log(lda2(:,:,end))/(2*abs(t_fin-t_init));
imagesc(Y(:,1,1),X(1,:,1), rot90(FTLE,3 ));
set(gca,'DataAspectRatio',[1 1 1]);
axis ([-2.5 2.5 -1 1 ]);
colorbar
caxis([0 0.15]);

%%
figure; hold all
plot(Y(:,:,1),X(:,:,1), 'o');
set(gca,'DataAspectRatio',[1 1 1]);
axis ([-2.5 2.5 -1 1 ]);
colorbar
caxis([0 0.15]);

%%

time = 300
deltat = 3

Ux = X(:,:,time+deltat) - X(:,:,time);
Uy = Y(:,:,time+deltat) - Y(:,:,time);

Xp = X;
Yp = Y;

figure; hold all
%imagesc(Yp(:,1,1),Xp(1,:,1),Uy);
quiver(Xp(1:5:499,1:5:199,1),Yp(1:5:499,1:5:199,1), Ux(1:5:499,1:5:199), Uy(1:5:499,1:5:199), 'AutoScale', 'off');
set(gca,'DataAspectRatio',[1 1 1]);
%axis ([-2.5 2.5 -1 1 ]);
colorbar
caxis([-0.05 0.05]);




