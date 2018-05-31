
function plot_funky(fig, sub, x, y, ax, tl, xl, yl, style)
% GRAPH(Fg,Sub,x,y,Ax,XL,YL,TL) makes a subplot
% on a figure using the following parameters
% Fg specifies the figure number.
% Sub specifies the subplot coordinates.
% x specifies the horizontal vector.
% y specifies the vertical vector.
% Ax specifies a vector containing the axes.
% XL specifies the x-axis label.
% YL specifies the y-axis label.
% TL specifies the subplot title.
figure(fig);
subplot(sub);
 
graph = plot(x, y);
axis(ax);
title(tl);
xlabel(xl);
ylabel(yl);
     
set(gcf,'Color','w');
     
axis on;
grid on;
     
end







