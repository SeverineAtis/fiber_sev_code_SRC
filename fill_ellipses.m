function fill_ellipses(xC, yC, a ,b , theta, n_points, color)


phi = linspace(0,2*pi*(n_points-1)/n_points,n_points);

n_el = numel(xC);

for k_el = 1:n_el
%     
    xE = xC(k_el) + b*cos(theta(k_el)) * cos(phi) - a * sin(theta(k_el)) * sin(phi);
    yE = yC(k_el) + a*sin(phi) * cos(theta(k_el)) + b * sin(theta(k_el)) * cos(phi);


   fill(xE,yE,color, 'LineStyle','none');

end

end