%Ana Rio Rodriguez 13034867
%
%

close all;
clear all;

%TIME DOMAIN

% time setup
N=16384;
fs=500e3;
Ts=1/fs;
To=Ts*N;
t=0:Ts:To;

% signal g(t) sinusoid
f1=2000;
g=2*cos(2*pi*f1*t);

% signal p(t) pulse
fc=25e3;
Tc=1/fc;
D=0:Tc:To-Ts;
p=pulstran(t,D,'tripuls',Tc/2);

% gs(t) sampled signal
gs=0.5*(g.*p);

% gr(t) final signal
f4=3000;
[b,a]=ellip(5,0.2,50,f4/(fs/2));
A=7.5;
gr=A*filter(b,a,gs);


% plot
TimeAxes=[0 2e-3 -2 2];

figure(1);


subplot(4,1,1);
plot(t,g);
axis(TimeAxes);
title('original sinusoid');
xlabel('t(s)');
ylabel('g(t)');


subplot(4,1,2);
plot(t,p);
axis(TimeAxes);
title('pulse signal');
xlabel('t(s)');
ylabel('p(t)');


subplot(4,1,3);
plot(t,gs);
axis(TimeAxes);
title('sampled signal');
xlabel('t(s)');
ylabel('gs(t)');



subplot(4,1,4);
plot(t,gr);
axis(TimeAxes);
title('final signal');
xlabel('t(s)');
ylabel('gr(t)');


%FREQUENCY DOMAIN

%frequency setup
fo=1/To;
f=0:fo:fs;
FrequencyAxes=[0 250e3 -80 0];

% Fourier transforms
G=fft(g)/N;
P=fft(p)/N;
Gs=fft(gs)/N;
Gr=fft(gr)/N;

Gmag=20*log10(abs(G));
Pmag=20*log10(abs(P));
Gsmag=20*log10(abs(Gs));
Grmag=20*log10(abs(Gr));

%plot

figure(2);

subplot(4,1,1);
plot(f,Gmag);
axis(FrequencyAxes);
title('original sinusoid');
xlabel('f(Hz)');
ylabel('G(f)');


subplot(4,1,2);
plot(f,Pmag);
axis(FrequencyAxes);
title('pulse signal');
xlabel('f(Hz)');
ylabel('P(f)');


subplot(4,1,3);
plot(f,Gsmag);
axis(FrequencyAxes);
title('sampled signal');
xlabel('f(Hz)');
ylabel('Gs(f)');



subplot(4,1,4);
plot(f,Grmag);
axis(FrequencyAxes);
title('final signal');
xlabel('f(Hz)');
ylabel('Gr(f)');

















