clear all;
close all;

fs = 500e3;
N = 16384;

syms t;

g = 2*cos(4000*pi*t);

fc = 25e3;
Tc = 1/fc;
D = 0:Tc:To-Ts;
p = pulstran(t, D, 'tripuls', Tc/2);


