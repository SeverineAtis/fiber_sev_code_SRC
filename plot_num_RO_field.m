time = 300
deltat = 100

Yp = rot90(X(:,:,:),3);
Xp = rot90(Y(:,:,:),3);

Ux = Xp(:,:,time+deltat) - Xp(:,:,time);
Uy = Yp(:,:,time+deltat) - Yp(:,:,time);



figure; hold all
%imagesc(Yp(:,1,1),Xp(1,:,1),Uy);
%quiver(Xp(1:5:499,1:5:199,1),Yp(1:5:499,1:5:199,1), Ux(1:5:499,1:5:199), Uy(1:5:499,1:5:199), 'AutoScale', 'off');



[omega, utheta] = curl(Xp(:,:,1),Yp(:,:,1),Ux,Uy);

pcolor(Xp(:,:,1),Yp(:,:,1),omega);
shading interp;
hold on;
%quiver(Xp(1:5:199,1:5:499,1),Yp(1:5:199,1:5:499,1), Ux(1:5:199,1:5:499), Ux(1:5:199,1:5:499),'AutoScale','on','AutoScaleFactor',5);
set(gca,'DataAspectRatio',[1 1 1]);
%axis ([-2.5 2.5 -1 1 ]);
colorbar
%caxis([-0.5 0.5]);

%%

time = 1
deltat = 20

Xp = X(:,:,:);
Yp = Y(:,:,:);

Ux = Xp(:,:,time+deltat) - Xp(:,:,time);
Uy = Yp(:,:,time+deltat) - Yp(:,:,time);
caxis([-1 1]);


%[Xpp, Ypp] = meshgrid(-1:0.01:1, -2.5:0.01:2.5);

Xpp = Xp(:,:,1);
Ypp = Yp(:,:,1);

figure; hold all
%imagesc(Yp(:,1,1),Xp(1,:,1),Uy);
%quiver(Xp(1:5:499,1:5:199,1),Yp(1:5:499,1:5:199,1), Ux(1:5:499,1:5:199), Uy(1:5:499,1:5:199), 'AutoScale', 'off');


[omegapp, utheta] = curl(Xpp ,Ypp, Ux ,Uy);
pcolor(Xpp,Ypp,omegapp);
shading interp;
%imagesc(Xpp(1,:),Ypp(:,1),Yp(:,:,time));
hold on;
quiver(Xpp(1:10:499,1:10:199),Ypp(1:10:499,1:10:199), Ux(1:10:499,1:10:199), Uy(1:10:499,1:10:199),'AutoScale','on','AutoScaleFactor',20);
set(gca,'DataAspectRatio',[1 1 1]);
%axis ([-2.5 2.5 -1 1 ]);
colorbar
caxis([-1 1]);
