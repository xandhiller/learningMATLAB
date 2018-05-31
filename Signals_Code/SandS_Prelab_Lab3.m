% Alexander Hiller 11850637
% Samin Saif 12551382

% S&S PreLab Lab 3

clear all;
close all;

% Element Values for the circuit:
R0 = 270;
R1 = 230;
R2 = 5000;
R3 = 10000;
R4 = 270;
R5 = 120;
C1 = 680e-9;
C5 = C1;


% Transfer Function Constants of First Circuit H1(s)
K1 = (R1*R3)/(R0*R2);
T1 = R1*C1;

% Transfer Function of First Circuit, Numerator and Denominator
num1 = [K1];
den1 = [T1 1];


% Transfer Function Constants of Second Circuit H2(s)
K2 = K1*R5/R4; 
T2 = R5*C5;

% Transfer Function of Second Circuit, Numerator and Denominator
num2 = [-K2];
den2 = [T1*T2 (T1+T2) 1];

% Log-spaced frequency vector
lowf = 10;
highf = 10e5;
f = logspace(log10(lowf),log10(highf),100);
w = 2*pi*f;


% Results from experiment

% Input frequencies for First Order Circuit
f1r = 1e3*[0.01,0.022,0.046,0.1,0.215,0.464,1.00,2.15,4.64,10,21.5,46.4,100];
% Input frequencies for Second Order Circuit
f2r = 1e3*[0.01,0.022,0.046,0.1,0.215,0.464,1.00,2.15,4.64,10,21.5];
% Gain measured in Decibels for First Order Circuit
Gain1 = [5.178,5.178,5.178,5.178,4.75,4.01,1.76,-2.75,-8.8,-14.86,-21.44,-26.90,-31.33];
% Gain measured in Decibels for Second Order Circuit
Gain2 = [-0.82,-0.82,-0.82,-1.04,-1.26,-2.28,-5.31,-13.14,-23.90,-34.59,-46.09];
% Angle difference measured Out->In for First Order Circuit
Theta1 = [-1.4,-2,-3.6,-6.5,-13.1,-26.8,-46.4,-66.1,-79,-82,-90,-93,-95];
% Angle difference measured Out->In for Second Order Circuit
Theta2 = [179,178,176,171,160,138,102,60,31,14,-10];

MagAxes = [10 1e6 -50 10];
AngleAxes = [10 1e6 -100 0];


% Transfer Functions of First Circuit
H1 = freqs(num1, den1, w);
H1mag = 20*log10(abs(H1));
H1p = phase(H1)*180/pi;

% Magnitude Plot of First Circuit
figure(1)
semilogx(f,H1mag);
hold % Using 'hold' allows us to plot more stuff on the graph.
plot(f1r,Gain1,'r') % Plots measured magnitude results in red.
axis(MagAxes)
xlabel('f (Hz)')
ylabel('Hmag (dB)')
title('First Order Magnitude')
legend('Predicted','Measured')
grid on;

% Frequency Plot of First Circuit
figure(2)
semilogx(f,H1p);
hold 
plot(f1r,Theta1,'r') % Plots measured phase results in red.
axis(AngleAxes)
xlabel('f (Hz)')
ylabel('Hp (deg)')
title('First Order Phase')
legend('Predicted','Measured')
grid on;

% Transfer Functions of Second Circuit
H2 = freqs(num2, den2, w);
H2mag = 20*log10(abs(H2));
H2p = phase(H2)*180/pi;

% Magnitude Plot of Second Circuit
figure(3)
semilogx(f,H2mag);
hold 
plot(f2r,Gain2,'r')
axis(MagAxes)
xlabel('f (Hz)')
ylabel('Hmag (dB)')
title('Second Order Magnitude')
legend('Predicted','Measured')
grid on;

% Frequency Plot of Second Circuit
figure(4)
semilogx(f,H2p);
hold 
plot(f2r,Theta2,'r')
legend('Predicted','Measured')
axis([10 1e6 -20 190])
xlabel('f (Hz)')
ylabel('Hp (deg)')
title('Second Order Phase' )
grid on;


% Step response of First Circuit
figure(5);
subplot(211);
step(num1, den1);
axis([0 1e-3 0 2]);
% Step response of Second Circuit
subplot(212);
step(abs(num2), den2); 
axis([0 1e-3 0 1]);


