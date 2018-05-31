clear all;

%% Variables
x = linspace(0, 2*pi);
y = x - sin(x);

%% Full angular rotation
figure(1);
subplot(211);
hold on
plot(x, x);
plot(x, sin(x));
plot(x,y);
title('Small diplacements to large displacements (\theta = [0,2\pi])');
axis([0,2*pi,0,6.5]);
grid on
legend('\theta', 'sin(\theta)', '\theta - sin(\theta)', 'location', 'northwest');

hold off;

%% Small angular displacements
subplot(212);
hold on;
plot(x, x);
plot(x, sin(x));
plot(x,y);
grid on;
title('Small displacements (\theta = [0,\pi/2 ])');
axis([0,pi/2,0,2]);
legend('\theta', 'sin(\theta)', '\theta - sin(\theta)', 'location', 'northwest');
hold off;
