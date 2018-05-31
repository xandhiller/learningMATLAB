clear all;
close all;

% Vin (DC)
Vin = [-2.5 -2.0 -1.5 -1.0 -0.5 -0.4 -0.2 -0.1 0 0.1 0.2 0.4 0.5 1 1.5 2 2.2 2.4 2.5];
% Vout (Sinusoidal pp)
Vout = [1.4 1.4 1.6 1.8 1.8 2.1 2.1 1.5 2.3 1.6 1.6 1.8 2.6 3.1 3.7 4.3 4.6 4.8 4.8];
% Frequency
FreqOut = 1e3*[1.01 0.934 0.840 0.749 0.742 0.624 0.5848 0.919 0.546 0.872 0.85 0.816 0.45 0.35 0.264 0.1628 0.122 0.08615 0.075];


% Lines of best fit:
VoutLineBestF = polyfit(Vin, Vout, 1); % Produces a polynomial of best-fit of order 1
FreqOutLineBestF = polyfit(Vin, FreqOut, 1); 

figure(1);

% Plot Vin vs Vout - w/ a line of best-fit
subplot(211);
plot(Vin, Vout, 'xk');
%hold on;
%plot(polyval(VoutLineBestF, Vin));
xlabel('DC Voltage-In (V)');
ylabel('Peak-to-Peak Voltage-Out (V)');
title('Sinusoidal Peak-to-Peak Voltage Produced by VCO');

% Plot Vin vs FreqOut - w/ a line of best-fit
subplot(212);
%hold on;
%plot(polyval(FreqOutLineBestF, Vin));
plot(Vin, FreqOut, 'xk');
xlabel('DC Voltage-In (V)');
ylabel('Frequency (Hz)');
title('Frequency of Sinusoid Produced by VCO');




