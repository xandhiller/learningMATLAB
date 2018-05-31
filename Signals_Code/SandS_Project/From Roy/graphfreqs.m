function graphfreqs(Fg,f,H,LineStyle,fe,He,PointStyle,Ax,XL,YL,Title)
 
figure(Fg);
semilogx(f,H,LineStyle);
hold;
plot(fe,He,PointStyle);
grid on;
axis(Ax);
xlabel(XL);
ylabel(YL);
title(Title);
 
%experimental points

