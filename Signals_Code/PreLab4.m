% Alexander Hiller 11850637
% Samin Saif 12551382

% Prelab Lab 4

clear all;
close all;

% Setting up Stage 1 
N=16384;
fs=500e3;
Ts=1/fs;
To=N*Ts;
fo = 1/(To);
t=0:Ts:To;
f=0:fo:fs;
TimeRange = [0,0.5e-3,-4,4];
FreqRange = [0,250e3,-70,10];

g1 = 2*cos(2*pi*2000*t);
g2 = 2*cos(2*pi*6000*t);

l1 = 2*cos(2*pi*100000*t);
l2 = 2*sin(2*pi*100000*t);

[b,a] = ellip(5,0.1,50,60000/(fs/2));

% Fourier transfrom of message signals
G1 = fft(g1)/N;
G2 = fft(g2)/N;

G1Mag = 20*log10(abs(G1));
G2Mag = 20*log10(abs(G2));

% Plotting Stage 1 in the Time Domain
figure(1);

subplot(221);
plot(t,g1);
axis(TimeRange);
xlabel('t (s)');
ylabel('Amplitude (volts)');
title('g1(t)');

subplot(222);
plot(t,l1);
axis(TimeRange);
xlabel('t (s)');
ylabel('Amplitude (volts)');
title('l1(t)');

subplot(223);
plot(t,g2);
axis(TimeRange);
xlabel('t (s)');
ylabel('Amplitude (volts)');
title('g2(t)');

subplot(224);
plot(t,l2);
axis(TimeRange);
xlabel('t (s)');
ylabel('Amplitude (volts)');
title('l2(t)');

% Plotting Stage 1 in the frequency domain
figure(2);

subplot(211);
plot(f,G1Mag);
axis(FreqRange);
xlabel('f (Hz)');
ylabel('A (dB)');
title('Spectrum of g1(t)');

subplot(212);
plot(f,G2Mag);
axis(FreqRange);
xlabel('f (Hz');
ylabel('A (dB)');
title('Spectrum of g2(t)');

% Stage 2
gm1 = 0.5*g1.*l1;
gm2 = 0.5*g2.*l2;
gQAM = gm1+gm2;

GM1 = fft(gm1)/N;
GM2 = fft(gm2)/N;
GQAM = fft(gQAM)/N;
GM1Mag = 20*log10(abs(GM1));
GM2Mag = 20*log10(abs(GM2));
GQAMMag = 20*log10(abs(GQAM));

% Plotting Stage 2 in Time Domain
figure(3);

subplot(311);
plot(t,gm1);
axis(TimeRange);
xlabel('t (s)');
ylabel('Amplitude (volts)');
title('g1m(t)');

subplot(312);
plot(t,gm2);
axis(TimeRange);
xlabel('t (s)');
ylabel('Amplitude (volts)');
title('g2m(t)');

subplot(313);
plot(t,gQAM);
axis(TimeRange);
xlabel('t (s)');
ylabel('Amplitude (volts)');
title('gQAM(t)');

% Plotting Stage 2 in the Frequency Domain
figure(4);

subplot(311);
plot(f,GM1Mag);
axis(FreqRange);
xlabel('f (Hz)');
ylabel('A (dB)');
title('Spectrum of gm1(t)');

subplot(312);
plot(f,GM2Mag);
axis(FreqRange);
xlabel('f (Hz)');
ylabel('A (dB)');
title('Spectrum of gm2(t)');

subplot(313);
plot(f,GQAMMag);
axis(FreqRange);
xlabel('f (Hz)');
ylabel('A (dB)');
title('Spectrum of gQAM(t)');

% Stage 3
gi1 = 0.5*gQAM.*l1;
gi2 = 0.5*gQAM.*l2;

Gi1 = fft(gi1)/N;
Gi2 = fft(gi2)/N;
Gi1Mag = 20*log10(abs(Gi1));
Gi2Mag = 20*log10(abs(Gi2));

% Plotting Stage 3 in the Time Domain
figure(5);

subplot(211);
plot(t,gi1);
axis(TimeRange);
xlabel('t (s)');
ylabel('Amplitude (volts)');
title('gi1(t)');

subplot(212);
plot(t,gi2);
axis(TimeRange);
xlabel('t (s)');
ylabel('Amplitude (volts)');
title('gi2(t)');

% Plotting Stage 3 in the Frequency Domain
figure(6);

subplot(211);
plot(f,Gi1Mag);
axis(FreqRange);
xlabel('f (Hz)');
ylabel('A (dB)');
title('Spectrum of gi1(t)');

subplot(212);
plot(f,Gi2Mag);
axis(FreqRange);
xlabel('f (Hz)');
ylabel('A (dB)');
title('Spectrum of gi2(t)');


% Stage 4
A = 4;                     % Gain of LPF for reconstructing g1
B = 4;                     % Gain of LPF for reconstructing g2
gr1 = A*filter(b,a,gi1);    % Reconstructed g1 signal
gr2 = B*filter(b,a,gi2);    % Reconstructed g2 signal

Gr1 = fft(gr1)/N;
Gr2 = fft(gr2)/N;
Gr1Mag = 20*log10(abs(Gr1));
Gr2Mag = 20*log10(abs(Gr2));

% Plotting Stage 4 in the Time Domain
figure(7);

subplot(211);
plot(t,gr1);
axis(TimeRange);
xlabel('t (s)');
ylabel('Amplitude (volts)');
title('Reconstructed g1 signal');

subplot(212);
plot(t,gr2);
axis(TimeRange);
xlabel('t (s)');
ylabel('Amplitude (volts)');
title('Reconstructed g2 signal');

% Plotting Stage 4 in the Frequency Domain
figure(8);

subplot(211);
plot(f,Gr1Mag);
axis(FreqRange);
xlabel('f (Hz)');
ylabel('A (dB)');
title('Spectrum of Reconstructed g1(t)');

subplot(212);
plot(f,Gr2Mag);
axis(FreqRange);
xlabel('f (Hz)');
ylabel('A (dB)');
title('Spectrum of Reconstructed g2(t)');


