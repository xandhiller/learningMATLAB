clear all;

%% Setup
zeta = linspace(0.2,1.1,10);

wn = 2*pi;

figure(1);

%% Step Response
subplot(211);
hold on;
for i = 1:10
  y = tf([wn^2],[1, 2*zeta(i)*wn, wn^2]);
  step(y)
end
hold off;

%% Impulse Response
subplot(212);
hold on;
for i = 1:10
  y = tf([wn^2],[1, 2*zeta(i)*wn, wn^2]);
  impulse(y)
end
hold off;

%% Bode Plot
figure(2);
hold on;
for i = 1:10
  y = tf([wn^2],[1, 2*zeta(i)*wn, wn^2]);
  bode(y)
end
hold off;
  