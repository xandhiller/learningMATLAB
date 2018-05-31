% Alexander Hiller 11850637   
% Roy Ziqi Wang 12614145

% Lab 6 MATLAB Post-Lab Work

clear all;
close all;

N = 100;
To = 4.5e-3;
Ts = To/N;
t = 0:Ts:To;
fLow = 0.1;
fHigh = 5;
f = logspace(log10(fLow),log10(fHigh),100);
w = 2*pi*f;

% transfer function
num = [36/77];
den = [0.3 1];
MRtf = tf(num,den);

% axis
MagAxes = [0.1 5 -20 0];
PhaseAxes = [0 5 -90 0];

% experimental values
fexp = [0.1 0.15 0.25 0.5 0.53 0.7 0.9 1 1.5 1.8 2 2.2 2.4 2.6 2.8];
gain = [0.5199 0.5199 0.5 0.4005 0.4005 0.3408 0.3010 0.2811 0.199 0.1791 0.1592 0.1393 0.1393 0.1393 0.1194];


MRresponse = freqs(num,den,w);
f1 = [0.1 0.15 0.25 0.5 0.53 0.7 0.9 1 1.5 1.8 2 2.2 2.4 2.6 2.8];
MeasuredMag = [0.5199 0.5199 0.5 0.4005 0.4005 0.3408 0.3010 0.2811 0.199 0.1791 0.1592 0.1393 0.1393 0.1393 0.1194];
MeasuredPhase = [-9.83 -15.9 -24.7 -43.6 -45.5 -53.9 -62.9 -64.5 -77.4 -80.2 -84.9 -87 -86.7 -89.7 -90.7];

TheoreticalPhase = phase(MRresponse)*180/pi;

% plots
figure(1);

% Magnitude of Freq Response of MR
subplot(121);
semilogx(f,20*log10(abs(MRresponse)),'-k');
hold;
plot(f1,20*log10(MeasuredMag),'-x');
grid on;
axis(MagAxes);
xlabel('f (Hz)');
ylabel('Magnitude of MR Frequency Reponse (dB)');
title('Magnitude of MR Frequency Response');
legend('Theoretical','Measured');

% Phase of Freq Response of MR
subplot(122);
semilogx(f, TheoreticalPhase, '-k');
hold;
plot(f1, MeasuredPhase, '-x');
grid on;
axis(PhaseAxes);
xlabel('f (Hz)');
ylabel('Phase of MR Frequency Response (degrees)');
title('Phase of MR Frequency Response');
legend('Theoretical','Measured');

figure(2);
step(MRtf);
xlabel('Time (sec)');
ylabel('Voltage (V)');
