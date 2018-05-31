% Alexander Hiller 11850637
% Samin Saif 12551382

% Prelab Lab 5

% Component values
R0 = 270;
R1 = 980;
R2 = 6800;
R3 = 10000;
R4 = 270;
R5 = 980;
R6 = 1000;
R8 = 1000;
R9 = 953;
C1 = 680e-9;
C5 = 680e-9;

% Gain Values
A0 = -1;        % Inverter on the initial entry.
A1 = ;         % Set A1-A4 to 1 for default.
A2 = 1;
A3 = 1;
A4 = 1;

% Time and Freq Vector Setup
N=16384;
fs=500e3;
Ts=1/fs;
To=N*Ts;
fo = 1/(To);
t=0:Ts:To;
f=0:fo:fs;

% T1 Plotting -- Vout3/Vin1
% T1 Axes
MagAxes1 = [10, 100e3, -50, 10];
PhaseAxes1 = [10, 100e3, -180, 0];
StepAxes1 = [-0.5e-3, 4.5e-3, -0.5, 1.5];

% T1 Transfer Function
num1 = [R3/(R0*R2*R4*C1*C5)];
den1 = [1, (1/(R1*C1) + 1/(R5*C5)), ( R3/(R2*R4*RF*C1*C5) + 1/(R1*R5*C1*C5) )];
HT1 = tf(num1, den1);

figure(1); 
% T1 Step-Response
subplot(311);
step(HT1);
axis(StepAxes1);
xlabel();
ylabel();

% Computing T1 Phase


% Plot T1 Phase
subplot(312);
plot();
axis(StepAxes1);
xlabel();
ylabel();

% Computing T1 Magnitude


% Plot T1 Magnitude
subplot(313);
plot();
axis(StepAxes1);
xlabel();
ylabel();

% T2 Plotting -- Vout1/Vin1
% T2 Axes
MagAxes2 = [10, 100e3, -30, 10];
PhaseAxes2 = [10, 100e3, -100, 100];
StepAxes2 = [-0.5e-3, 4.5e-3, -0.5, 1.5];
HT2 = tf();

figure(2); 
% Plot T2 Step-Response
subplot(311);
step(HT2);
axis(StepAxes2);
xlabel();
ylabel();

% Computing T2 Phase


% Plot T2 Phase
subplot(312);
plot();
axis(StepAxes2);
xlabel();
ylabel();

% Computing T2 Magnitude


% Plot T2 Magnitude
subplot(313);
plot();
axis(StepAxes2);
xlabel();
ylabel();

% T3 Plotting -- Vout4/vin1
% T3 Axes
MagAxes3 = [10, 100e3, -50, 10];
PhaseAxes3 = [10, 100e3, 0, 135];
StepAxes3 = [-0.5e-3, 4.5e-3, -0.5, 1.5];
HT3 = tf();

figure(3); 
% Plot T3 Step-Response
subplot(311);
step(HT3);
axis(StepAxes3);
xlabel();
ylabel();

% Computing T3 Phase


% Plot T3 Phase
subplot(312);
plot();
axis(StepAxes3);
xlabel();
ylabel();

% Computing T3 Magnitude


% Plot T3 Magnitude
subplot(313);
plot();
axis(StepAxes3);
xlabel();
ylabel();
