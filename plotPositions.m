Xsph = Y;
Ysph = -X;
[Ltrac Ctrac] = size(X(:,:,1));
t_fin = size(X,3);
%t_last = floor(t_fin/2)
t_last = t_fin - 1;
%window = 30000;
window = t_last - 1;
dt = 100;

figure; hold all;
for t = t_last-window : dt : t_last
plot(Xsph(1:1:Ltrac,1:1:Ctrac,t),Ysph(1:1:Ltrac,1:1:Ctrac,t),'o','MarkerSize',1,'MarkerEdgeColor','g');%[1 0.2 0]);%, 'MarkerFaceColor', 'k');
set(gca,'DataAspectRatio',[1 1 1])  
end

% for t = 1:10: 1000
% plot(Xsph(1:3:Ltrac,1:3:Ctrac,t),Ysph(1:3:Ltrac,1:3:Ctrac,t), 'o','MarkerEdgeColor',[0 0.8 0.1], 'MarkerSize', 1);%, 'MarkerFaceColor', 'k');
% set(gca,'DataAspectRatio',[1 1 1])  
% end

axis ([-1.5 1.5 -0.5 0.5]);

%%
figure; hold all;
Xsph = X;
Ysph = Y;
[Ltrac Ctrac] = size(X(:,:,1));
t_fin = size(X,3);

for t = 1:2 :2000 
plot(Xsph(1:2:Ltrac,1:2:Ctrac,t),Ysph(1:2:Ltrac,1:2:Ctrac,t), 'o','MarkerEdgeColor',[0 0 0], 'MarkerSize', 1);%, 'MarkerFaceColor', 'k');
set(gca,'DataAspectRatio',[1 1 1])  
end

%axis ([-1.5 1.5 -0.5 0.5]);  
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
t_fin = size(X,3);
t_start = t_fin - 10000;
Dt_fig = 1000;

% t_fin = 1001;
% t_start = t_fin - 1000;
% Dt_fig = 100;

Xelli = X;
Yelli = Y;
[Lelli Celli] = size(X(:,:,1));

a = 0.005;
b = 0.04;

figure; hold on;
fill_ellipses(Xelli(1:1:Lelli,1:1:Celli,t_start:Dt_fig:t_fin),Yelli(1:1:Lelli,1:1:Celli,t_start:Dt_fig:t_fin),a ,b , Theta(1:1:Lelli,1:1:Celli,t_start:Dt_fig:t_fin), 20, 'b');
set(gca,'DataAspectRatio',[1 1 1]);
%set(gca,'Color',[0 0 0]);
%axis ([0 1 0 1]);   
axis ([-1.5 1.5 -0.5 0.5]);  

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





