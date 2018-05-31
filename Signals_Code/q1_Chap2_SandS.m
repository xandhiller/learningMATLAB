% Exercise one of Chapter 2 of the Signals & Systems notes.
% Shows the effect of sampling on a signal.
close all;
clear all;

% All the sampling rates.
Ti = 0.1;
Tii = 0.3;
Tiii = 0.5;
Tiv = 1;
Tv = 1e-3;

Ts = Ti;            % Start 'Ts' off as 'Ti'
t = -7:Ts:7;

% All the functions to test with.
xa = 1;
xb = cos(4*pi*t);
xc = cos(10*pi*t);

% Axes.
PlotAxes = [-7, 7, -1.5, 1.5];


% Plot with 'Ti' sampling rate.
produceGraph(1,331,t,xa,PlotAxes,'time (sec)','xa(t)','')
produceGraph(1,332,t,xb,PlotAxes,'time (sec)','xb(t)','')
produceGraph(1,333,t,xc,PlotAxes,'time (sec)','xc(t)','')

% Plot with 'Tii' sampling rate.
Ts = Tii;            % Change 'Ts' to 'Tii'
t = -7:Ts:7;
xa = 1;
xb = cos(4*pi*t);
xc = cos(10*pi*t);
produceGraph(1,334,t,xa,PlotAxes,'time (sec)','xa(t)','')
produceGraph(1,335,t,xb,PlotAxes,'time (sec)','xb(t)','')
produceGraph(1,336,t,xc,PlotAxes,'time (sec)','xc(t)','')

% Plot with 'Tiii' sampling rate.
Ts = Tiii;            % Change 'Ts' to 'Tiii'
t = -7:Ts:7;
xa = 1;
xb = cos(4*pi*t);
xc = cos(10*pi*t);
produceGraph(1,337,t,xa,PlotAxes,'time (sec)','xa(t)','')
produceGraph(1,338,t,xb,PlotAxes,'time (sec)','xb(t)','')
produceGraph(1,339,t,xc,PlotAxes,'time (sec)','xc(t)','')

% Plot with 'Tiv' sampling rate.
Ts = Tiv;            % Change 'Ts' to 'Tiv'
t = -7:Ts:7;
xa = 1;
xb = cos(4*pi*t);
xc = cos(10*pi*t);
produceGraph(2,321,t,xa,PlotAxes,'time (sec)','xa(t)','')
produceGraph(2,322,t,xb,PlotAxes,'time (sec)','xb(t)','')
produceGraph(2,323,t,xc,PlotAxes,'time (sec)','xc(t)','')

% Plot with Tv sampling rate.
Ts = Tv;            % Change 'Ts' to 'Tv'
t = -7:Ts:7;
xa = 1;
xb = cos(4*pi*t);
xc = cos(10*pi*t);
produceGraph(2,324,t,xa,PlotAxes,'time (sec)','xa(t)','')
produceGraph(2,325,t,xb,PlotAxes,'time (sec)','xb(t)','')
produceGraph(2,326,t,xc,PlotAxes,'time (sec)','xc(t)','')



