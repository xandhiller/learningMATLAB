function produceGraph(Fg,Sub,x,y,Ax,XL,YL,TL)
%GRAPH Makes a subplot on a particular figure.
%   GRAPH(Fg,Sub,x,y,Ax,XL,YL,TL) makes a subplot
%   on a figure using the following parameters
%   Fg specifies the figure number.
%   Sub specifies the subplot coordinates.
%   x specifies the horizontal vector.
%   y specifies the vertical vector. 
%   Ax specifies a vector containing the axes. Has to be 1x3 Matrix.
%   XL specifies the x-axis label. Has to be string.
%   YL specifies the y-axis label. Has to be string.
%   TL specifies the subplot title. Has to be string.

figure(Fg);
subplot(Sub);
plot(x,y)
axis(Ax);
xlabel(XL);
ylabel(YL);
title(TL);

end

