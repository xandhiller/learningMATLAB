function graphstep(Fg,t,y,Ax,XL,YL,Title)
 
figure(Fg);
plot(t,y);
grid on;
axis(Ax);
xlabel(XL);
ylabel(YL);
title(Title);