% Alexander Hiller 11850637
% Samin Saif 12551382

% Prelab Lab 5

clear all;
close all;

R0 = 270;
R1 = 980;
R2 = 6800;
R3 = 10000;
R4 = 270;
R5 = 980;
R6 = 1000;
Rf = 270;
R8 = 1000;
R9 = 953;
C1 = 680e-9;
C5 = 680e-9;

% Experimental results:

% T1 Inputs
f1r = 1e3*[0.02,0.043,0.093,0.2,0.43,0.93,1.27,2.0,4.3,9.3,20];
% T2 Inputs
f2r = 1e3*[0.02,0.043,0.093,0.2,0.43,0.93,1.28,2.0,4.3,9.3,20];
% T3 Inputs
f3r = 1e3*[0.02,0.043,0.093,0.2,0.43,0.93,1.31,2.0,4.3,9.3,20];
% Gain for T1
Gain1 = [0.313,0.313,0.313,0.313,0.907,5.654,16.636,-1.859,-19.165,-31.805,-39.921,];
% Gain for T2
Gain2 = [-27.307,-26.597,-24.098,-19.238,-12.550,-1.286,13.126,-2.472,-13.144,-19.921,-26.428];
% Gain for T3
Gain3 = [-23.866,-23.607,-23.110,-0.981,-14.367,0.650,19.915,5.087,0.957,0.167,0.167];
% Phase Measurement for T1
Theta1 = [0,-0.2,-1.6,-4.3,-12.12,-59.3,-82.8,-160.9,-162.1,-171.2,-181.8];
% Phase Measurement for T2
Theta2 = [1.05,7.9,18.06,35.8,51.1,17.6,-81.8,-94.8,-89.6,-92.4,-81.6];
% Phase Measurement for T3
Theta3 = [104.6,108.8,114.9,125.6,136.8,101.9,65,6.8,1.4,0.94,-2.9];



% Bounds of Frequency
f1 = 10;
f2 = 100000;

top = R3/(R0*R2*R4*C1*C5);
bottom1 = 1;
twoalpha = (1/(R1*C1))+(1/(R5*C5));
wn2 = (R3/(R2*R4*Rf*C1*C5))+(1/(R1*R5*C1*C5));

%T1
b = [top];
a = [1 twoalpha wn2];
f = logspace(log10(f1),log10(f2),100);
w = 2*pi*f;
h = freqs(b,a,w);
mag = 20*log10(abs(h));
phase = angle(h);
phasedeg = phase*180/pi;


H=tf(b,a);
MagAxes = [10 100000 -50 20];
PhaseAxes = [10 100000 -180 0];
StepAxes = [-0.5e-3 4.5e-3 -0.5 1.5];

%Plotting T1
figure(1);

%Frequency Magnitude Response
subplot(311),
semilogx(f,mag);
hold 
plot(f1r,Gain1,'r') 
axis(MagAxes);
xlabel('f (hz)');
ylabel('Gain (dB)');
title('Frequency Response Magnitude of T1');

%Frequency Phase Response
subplot(312),
semilogx(f,phasedeg,'b');
hold 
plot(f1r,Theta1,'r') % Plots measured phase results in red.
axis(PhaseAxes)
xlabel('f (hz)');
ylabel('Phase (deg)');
title('Frequency Response Phase of T1');

%Step Response
subplot(313);
step(H);
axis(StepAxes);
xlabel('Time (s)');
ylabel('Magnitude');
title('Step Response of T1');

% T2 Figure
figure(2);

% T2 setup
alpha = twoalpha/2;
K1 = alpha*(R1/R0);

b = [K1 K1*alpha];
a = [1 twoalpha wn2];
f = logspace(log10(f1),log10(f2),100);
w = 2*pi*f;
h = freqs(b,a,w);
mag = 20*log10(abs(h));
phase = angle(h);
phasedeg = phase*180/pi;

H=tf(b,a);
StepAxes2 = [-0.5e-3 4.5e-3 -0.5 1.5];
MagAxes2 = [10 100000 -30 20];
PhaseAxes2 = [10 100000 -100 100];

% Gain of Frequency Response of T2
subplot(311),
semilogx(f,mag);
hold 
plot(f2r,Gain2,'r')
axis(MagAxes2);
xlabel('f (hz)');
ylabel('Gain (dB)');
title('Frequency Response Magnitude of T2');

% Phase of Frequency Response of T2
subplot(312),
semilogx(f,phasedeg);
hold 
plot(f2r,Theta2,'r')
axis(PhaseAxes2);
xlabel('f (hz)');
ylabel('Phase (deg)');
title('Frequency Response Phase of T2');

% Step Response of T2
subplot(313);
step(H);
axis(StepAxes2);
xlabel('Time (s)');
ylabel('Magnitude');
title('Step Response of T2');


% T3 Figure
figure(3);

% T3 setup
b = [1 twoalpha 0];
a = [1 twoalpha wn2];
f = logspace(log10(f1),log10(f2),100);
w = 2*pi*f;
freqs(b,a,w);
h = freqs(b,a,w);
mag = 20*log10(abs(h));
phase = angle(h);
phasedeg = phase*180/pi;

H=tf(b,a);

StepAxes3 = [-0.5e-3 4.5e-3 -0.5 1.5];
MagAxes3 = [10 100000 -50 20];
PhaseAxes3 = [10 100000 0 145];

% Gain of Frequency Response of T3
subplot(311),
semilogx(f,mag);
hold 
plot(f3r,Gain3,'r')
axis(MagAxes3);
xlabel('f (hz)');
ylabel('Gain (dB)');
title('Frequency Response Magnitude of T3');

% Phase of Frequency Response of T3
subplot(312),
semilogx(f,phasedeg);
hold 
plot(f3r,Theta3,'r')
axis(PhaseAxes3);
xlabel('f (hz)');
ylabel('Phase (deg)');
title('Frequency Response Phase of T3');
 
% Step Response of T3
subplot(313);
step(H);
axis(StepAxes3);
xlabel('Time (s)');
ylabel('Magnitude');
title('Step Response of T3');

