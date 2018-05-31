% Signals and Systems Simulations

%   Alex Hiller   11850637 
%   Ziqi Wang     12614145

clear all;
close all;

Mfs = 250;  % Maze Rover Sample Frequency

% Scheme 1 - State Variable

%   Scheme 1
k = 0.3325;
k0 = 2.103;
k1 = 0.05958;
k2 = 1;
taoMotor = 0.4;

g1 = k0;
h1 = tf([k1 k2],[1]);

% Functions to be used throughout
integ = tf([1],[1 0]);          % Gives a 1/s => an integrator
M_s = tf([k],[taoMotor, 1]);    % Maze Rover transfer function


Sch1 = feedback(g1* M_s * Mfs * integ, h1);


%   Plotting Scheme 1 - Continuous and Discrete
figure(1);
subplot(211);
step(Sch1);
title('Scheme 1: Continuous');
legend('Continuous');
subplot(212);
step((c2d(Sch1, 0.004, 'tustin')), 'r');
title('Scheme 1: Discrete');
legend('Discrete');

print('-dpdf','scheme1_simulation.pdf')

% Scheme 2 - Root Locus Method
zc = 2.536; 
pc = 31.76;
k3 = 1.8604;

g2 = k3*tf([1, zc],[1, pc]);
h2 = 1;

Sch2 = feedback(g2 * M_s * Mfs * integ, h2); % Continuous function

%   Plotting Scheme 2 - Continuous and Discrete
figure(2);
subplot(211);
step(Sch2);
title('Scheme 2: Continuous');
legend('Continuous');
subplot(212);
step((c2d(Sch2, 0.004, 'tustin')), 'r');
title('Scheme 2: Discrete');
legend('Discrete');

print('-dpdf','scheme2_simulation.pdf')

% Scheme 3 - Feed Forward Method
k4 = 0.1253;
k5 = 16.785;

g3 = k4*k5;
h3 = tf([0.0595 1],[1]);

Sch3 = feedback(g3 * M_s * Mfs * integ, h3);

%   Plotting Scheme 3 - Continuous and Discrete
figure(3);
subplot(211);
step(Sch3);
title('Scheme 3: Continuous');
legend('Continuous');
subplot(212);
step((c2d(Sch3, 0.004, 'tustin')), 'r');
title('Scheme 3: Discrete');
legend('Discrete');

print('-dpdf','scheme3_simulation.pdf')

% Demodulation Simulation
fs = 12500;
Ts = 1/fs;
N = 4096; % Not sure if this is the correct value

fAlias = fs/2;

T0 = N*Ts;
f0 = 1/T0;
t = 0:Ts:T0-Ts;
f = -fAlias:f0:(fAlias)-1;

f1 = 200; % Message signal 1
f2 = 250; % Message signal 2
fc = 925; % Carrier frequency

% Message signals
l = cos(2*pi*fc*t);
g1 = cos(2*pi*f1*t);
g2 = cos(2*pi*f2*t);
g3 = g1 + g2;
 
% Modulated message signals
mg1_mod = g1.*l;
mg2_mod = g2.*l;
mg3_mod = g3.*l;
demod_g1 = mg1_mod.*l;
demod_g2 = mg2_mod.*l;
demod_g3 = mg3_mod.*l;
  
m = 250;
  
comb_denominator = 1;
comb_numerator = [1 zeros(1, m-2) -1];
Hc = freqz(comb_numerator, comb_denominator, f, fs);
 

% Resonator coefficients
r = 0.99999;
r2 = r^2;
r11 = -2*r*cos(2*pi*f1*Ts);
r21 = -2*r*cos(2*pi*f2*Ts);
r10 = 280;
r20 = 230;
 
% Resonator filter
r_denominator_1 = [1 r11 r2];
r_numerator_1 = 1/r10;
H1 = freqz(r_numerator_1, r_denominator_1, f, fs);
  
r_denominator_2 = [1 r21 r2];
r_numerator_2 = 1/r20;
H2 = freqz(r_numerator_2, r_denominator_2, f, fs);
 

% Comb filter
c1 = filter(comb_numerator, comb_denominator, demod_g1);
c2 = filter(comb_numerator, comb_denominator, demod_g2);
c3 = filter(comb_numerator, comb_denominator, demod_g3);
  
r1 = 0.5*filter(r_numerator_1, r_denominator_1, c1);
r2 = 0.5*filter(r_numerator_2, r_denominator_2, c2);
r3 = r1 + r2;


% Magnitude Spectra in Demodulator
G1 = fftshift(fft(g1))/N;
G1_mag = 20*log10(abs(G1));
G2 = fftshift(fft(g2))/N;
G2_mag = 20*log10(abs(G2));
G3 = fftshift(fft(g3))/N;
G3_mag = 20*log10(abs(G3));
 
L = fftshift(fft(l))/N;
L_mag = 20*log10(abs(L));
 
mg1 = fftshift(fft(mg1_mod))/N;
mg1_mag = 20*log10(abs(mg1));
mg2 = fftshift(fft(mg2_mod))/N;
mg2_mag = 20*log10(abs(mg2));
mg3 = fftshift(fft(mg3_mod))/N;
mg3_mag = 20*log10(abs(mg3));
 
dG1 = fftshift(fft(demod_g1))/N;
dG1_mag = 20*log10(abs(dG1));
dG2 = fftshift(fft(demod_g2))/N;
dG2_mag = 20*log10(abs(dG2));
dG3 = fftshift(fft(demod_g3))/N;
dG3_mag = 20*log10(abs(dG3));
 
C1 = fftshift(fft(c1))/N;
C1_mag = 20*log10(abs(C1));
C2 = fftshift(fft(c2))/N;
C2_mag = 20*log10(abs(C2));
C3 = fftshift(fft(c3))/N;
C3_mag = 20*log10(abs(C3));
 
R1 = fftshift(fft(r1))/N;
R1_mag = 20*log10(abs(R1));
R2 = fftshift(fft(r2))/N;
R2_mag = 20*log10(abs(R2));
R3 = fftshift(fft(r3))/N;
R3_mag = 20*log10(abs(R3));
 
% Plotting vr_denominator_variables
TimeAxes = [0, 0.2,  -2,  2];
TimeAxes2 = [0, 0.05, -2,  2];
FrequencyAxes = [-1000, 1000, -100, 0];
FrequencyAxes1 = [0, 1200, -40, 0];
FrequencyAxes2 = [-1300, 1300, -80, 0];
FrequencyAxes3 = [-1300, 1300, -80, 0];
FilterAxes = [-3000, 3000, -60,   10];
ResonatorAxes = [-350, 350,  -40,  20];
 
plot_funky(4, 321, t, g1, TimeAxes, 'Message 1','Time (s)','Voltage (V)');
plot_funky(4, 322, f, G1_mag, FrequencyAxes, 'Message 1','Frequency (Hz)','dB');
plot_funky(4, 323, t, g2,     TimeAxes,'Message 2','Time (s)','Voltage (V)');
plot_funky(4, 324, f, G2_mag, FrequencyAxes, 'Message 2','Frequency (Hz)','dB');
plot_funky(4, 325, t, g3, TimeAxes,'Message 1 and 2','Time (s)','Voltage (V)');
plot_funky(4, 326, f, G3_mag, FrequencyAxes,'Message 1 and 2','Frequency (Hz)','dB');

print('-dpdf','messages.pdf')

plot_funky(5, 421, t, l, TimeAxes2,'Carrier','Time (s)','Voltage (V)');
plot_funky(5, 422, f, L_mag, FrequencyAxes2,'Carrier','Frequency (Hz)','dB');
plot_funky(5, 423, t, mg1_mod, TimeAxes2, 'Message 1 Modulated', 'Time (s)', 'Voltage (V)');
plot_funky(5, 424, f, mg1_mag, FrequencyAxes2,'Message 1 Modulated', 'Frequency (Hz)',   'dB');
plot_funky(5, 425, t, mg2_mod, TimeAxes2, 'Message 2 Modulated', 'Time (s)', 'Voltage (V)');
plot_funky(5, 426, f, mg2_mag, FrequencyAxes2,'Message 2 Modulated', 'Frequency (Hz)',   'dB');
plot_funky(5, 427, t, mg3_mod, TimeAxes2,'Message 1 and 2 Modulated', 'Time (s)',         'Voltage (V)');
plot_funky(5, 428, f, mg3_mag, FrequencyAxes2,'Message 1 and 2 Modulated','Frequency (Hz)',   'dB');
 
print('-dpdf','modulated_messages.pdf')

plot_funky(6, 321, t, demod_g1, TimeAxes2, 'Demodulated Message 1', 'Time (s)', 'Voltage (V)');
plot_funky(6, 322, f, dG1_mag, FrequencyAxes, 'Demodulated Message 1','Frequency (Hz)',   'dB');
plot_funky(6, 323, t, demod_g2, TimeAxes2,'Demodulated Message 2','Time (s)','Voltage (V)');
plot_funky(6, 324, f, dG2_mag,FrequencyAxes, 'Demodulated Message 2','Frequency (Hz)',   'dB');
plot_funky(6, 325, t, demod_g3, TimeAxes2,'Demodulated Message 1 and 2','Time (s)','Voltage (V)');
plot_funky(6, 326, f, dG3_mag,FrequencyAxes,'Demodulated Message 1 and 2','Frequency (Hz)','dB');
 
print('-dpdf','demodulated_messages.pdf')
 
plot_funky(7, 311, f, 20*log10(abs(Hc)),FilterAxes,'Comb Filter Response','Frequency (Hz)','dB');
plot_funky(7, 312, f, 20*log10(abs(H1)),ResonatorAxes,'Resonator 1 Response','Frequency (Hz)','dB');
plot_funky(7, 313, f, 20*log10(abs(H2)),ResonatorAxes,'Resonator 2 Response','Frequency (Hz)','dB');
 
print('-dpdf','resonator_response.pdf')
 


plot_funky(8, 321, t, c1, TimeAxes2, 'Comb Filter Output Message 1', 'Time (s)', 'Voltage (V)');
plot_funky(8, 322, f, C1_mag, FrequencyAxes,'Comb Filter Output Message 1', 'Frequency (Hz)','dB');
plot_funky(8, 323, t, c2, TimeAxes2, 'Comb Filter Output Message 2', 'Time (s)', 'Voltage (V)');
plot_funky(8, 324, f, C2_mag, FrequencyAxes, 'Comb Filter Output Message 2', 'Frequency (Hz)','dB');
plot_funky(8, 325, t, c3, TimeAxes2, 'Comb Filter Output Message 1 and 2', 'Time (s)','Voltage (V)');
plot_funky(8, 326, f, C3_mag, FrequencyAxes, 'Comb Filter Output Message 1 and 2','Frequency (Hz)',   'dB');
 
print('-dpdf','comb_filter_output.pdf')
 
plot_funky(9, 321, t, r1, TimeAxes2,'Demodulator Output Message 1','Time (s)','Voltage (V)');
plot_funky(9, 322, f, R1_mag, FrequencyAxes3,'Demodulator Output Message 1','Frequency (Hz)','dB');
plot_funky(9, 323, t, r2, TimeAxes2,'Demodulator Output Message 2','Time (s)','Voltage (V)');
plot_funky(9, 324, f, R2_mag, FrequencyAxes3,'Demodulator Output Message 2','Frequency (Hz)', 'dB');
plot_funky(9, 325, t, r3, TimeAxes2, 'Demodulator Output Message 1 and 2','Time (s)', 'Voltage (V)');
plot_funky(9, 326, f, R3_mag, FrequencyAxes3,'Demodulator Output Message 1 and 2','Frequency (Hz)',   'dB');
 
print('-dpdf','demodulator_output.pdf')
