clear all;
close all;

T0 = 0;
Ts = 10e-4;
Tf = 2;

Tp = 40e-6;         % The period of the pulse train.
n = 0:(Tf-T0)/Tp;     % Incremental discrete value for sigma summing.

t = T0:Ts:Tf;



g = 2*cos(4000*pi*t);

p = 