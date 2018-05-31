clear all;
close all;

N=16384;
fs=12500;
Ts=1/fs;
To=N*Ts;
fo = 1/(To);
t=0:Ts:To;
f=0:fo:fs;

f1 = 200; % Frequency of message 1
f2 = 250; % Frequency of message 2



