% clear and close everything
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

% Results from experiment

% Input frequencies for T1
f1r = 1e3*[0.02,0.043,0.093,0.2,0.43,0.93,1.035,2.0,4.3,9.3,20];
% Input frequencies for T2
f2r = 1e3*[0.02,0.043,0.093,0.2,0.43,0.93,1.050,2.0,4.3,9.3,20];
% Input frequencies for T3
f3r = 1e3*[0.02,0.043,0.093,0.2,0.43,0.93,1.090,2.0,4.3,9.3,20];
% Gain measured in Decibels for T1
Gain1 = [-1.1967,-0.6238,-0.6238,-1.0015,0,5.977,6.399,-8.49,-22.922,-32.887,-37.456];
% Gain measured in Decibels for T2
Gain2 = [-14.629,-14.629,-13.714,-11.77,-7.066,3.72,4.729,-4.817,-12.887,-18.907,-24.928];
% Gain measured in Decibels for T3
Gain3 = [-21.76,-21.98,-20.84,-16.81,-9.105,5.886,8.327,2.6525,0.688,0.35,0];
% Angle difference measured Out->In for T1
Theta1 = [0,-0.2,-1.5,-4.3,-12,-58.7,-81.9,-159.4,-160.4,-169.5,-180];
% Angle difference measured Out->In for T2
Theta2 = [1,7.5,17.2,34.1,48.6,16.7,-77.9,-90.3,-85.3,-88,-77.7];
% Angle difference measured Out->In for T3
Theta3 = [100.55,104.6,110.45,120.77,131.54,97.95,62.5,6.5,1.3,0.9,-2.8];


%bounds
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
MagAxes = [10 100000 -50 10];
PhaseAxes = [10 100000 -180 0];
StepAxes = [-0.5e-3 4.5e-3 -0.5 1.5];

%Plotting First Order Circuit
figure(1);

%Frequency Magnitude Response
subplot(311),
semilogx(f,mag);
hold % Using 'hold' allows us to plot more stuff on the graph.
plot(f1r,Gain1,'r') % Plots measured magnitude results in red.
axis(MagAxes);
xlabel('f (hz)');
ylabel('20log|T| (DB)');
title('Frequency Response Magnitude');

%Frequency Phase Response
subplot(312),
semilogx(f,phasedeg,'b');
hold 
plot(f1r,Theta1,'r') % Plots measured phase results in red.
axis(PhaseAxes)
xlabel('f (hz)');
ylabel('Phase T');
title('Frequency Response Phase');

%Step Response
subplot(313);
step(H);
axis(StepAxes);
xlabel('time');
ylabel('Magnitude');
title('Step Response');

%T2
figure(2);

%Second Order Circuit
alpha = twoalpha/2;
K1 = alpha*(R1/R0);

b = [K1 K1*alpha];
a = [1 twoalpha wn2];
f = logspace(log10(f1),log10(f2),100);
w = 2*pi*f;
freqs(b,a,w);
h = freqs(b,a,w);
mag = 20*log10(abs(h));
phase = angle(h);
phasedeg = phase*180/pi;

H=tf(b,a);
StepAxes2 = [-0.5e-3 4.5e-3 -0.5 1.5];
MagAxes2 = [10 100000 -30 10];
PhaseAxes2 = [10 100000 -100 100];

%Frequency Magnitude Response
subplot(311),
semilogx(f,mag);
hold 
plot(f2r,Gain2,'r')
axis(MagAxes2);
xlabel('f (hz)');
ylabel('20log|T| (DB)');
title('Frequency Response Magnitude');

%Frequency Phase Response
subplot(312),
semilogx(f,phasedeg);
hold 
plot(f2r,Theta2,'r')
axis(PhaseAxes2);
xlabel('f (hz)');
ylabel('Phase T');
title('Frequency Response Phase');

%Step Response
subplot(313);
step(H);
axis(StepAxes2);
xlabel('time');
ylabel('Magnitude');
title('Step Response');


%T3
figure(3);

%Second Order Circuit
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
MagAxes3 = [10 100000 -50 10];
PhaseAxes3 = [10 100000 0 135];

%Frequency Magnitude Response
subplot(311),
semilogx(f,mag);
hold 
plot(f3r,Gain3,'r')
axis(MagAxes3);
xlabel('f (hz)');
ylabel('20log|T| (DB)');
title('Frequency Response Magnitude');

%Frequency Phase Response
subplot(312),
semilogx(f,phasedeg);
hold 
plot(f3r,Theta3,'r')
axis(PhaseAxes3);
xlabel('f (hz)');
ylabel('Phase T');
title('Frequency Response Phase');

%Step Response
subplot(313);
step(H);
axis(StepAxes3);
xlabel('time');
ylabel('Magnitude');
title('Step Response');
