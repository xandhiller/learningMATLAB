clear all;
close all;
clc;

t = linspace(0,6*pi, 1000);

y = cos(t)+0.5*cos(2*t)+2*cos(3*t)+0.5*cos(90*t)+10*exp(-2*t);

subplot
plot(t,y);
axis([0,2,-3,3]);