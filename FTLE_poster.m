t_init = 1;  
t_fin =120;

ttl = 'FTLE_field';
visibility = 'on';

figure;
imagesc(  Y(:,1,1), X(1,:,1),rot90(log(lda2(:,:,end)))/(2*abs(t_fin-t_init)));
set(gca,'DataAspectRatio',[1 1 1]);
set(gca,'ydir','normal')
colorbar;
caxis([0 0.1])
set(gca, 'Color', 'None')
set(gcf, 'color', 'none',...
         'inverthardcopy', 'off');
