function [Y,UD] = hybrid(Np,Dp,Nd,Dd,T,t,U);
%HYBRID     [Y,UD]= hybrid(Np,Dp,Nd,Dd,T,t,U);
%
%           HYBRID returns the output vector Y and the control vector UC
%           of a hybrid system which is defined by Np, Dp, Nd and Dd.
%           The transfer function of the continuous time plant is stored
%           in Np and Dp.  Nd and Dd are the numerator and denominators 
%           of the transfer function of a discrete time controller.
%           T is the sampling period of the digital controller.  
%           t is a row vector of the times at which the inputs in U appear 
%           and U is a row vector of the system input. 
%           The increment in t must be chosen so that T is an integer multiple
%           of the increment, i.e., t=a:b:c then b=T/m where m>1 is an integer. 
%           Note that the system has only one input.
%                              
[Ac,Bc,Cc,Dc]=tf2ss(Np,Dp);
[Ad,Bd,Cd,Dd]=tf2ss(Nd,Dd);
nsam = T/(t(2)-t(1));    % number of integration pts per sample
% initialize 
Y = 0;
UD = 0;
[ncr,ncc] = size(Ac);
xc0 = zeros(ncr,1);
[ndr,ndc] = size(Ad);
xdk = zeros(ndr,1);
kmax = fix(t(length(t))/T);  % # of complete samples in t
for k = 0:kmax-1
  % calculate control and output of zoh
  ek = U(k*nsam+1) - Y(k*nsam+1);
  xd = Ad*xdk + Bd*ek;
  zoh = Cd*xdk + Dd*ek;
  xdk = xd;
  % integrate continuous-time plant with input of zoh for T seconds
  udi = zoh*ones(nsam+1,1);
  ti = t(k*nsam+1:(k+1)*nsam+1);
  tint = t(1:nsam+1);  % required for Matlab 5.0, shifts time, but
  % since this is a time-invariant system, the results won't change
    [yi,xi] = lsim(Ac,Bc,Cc,Dc,udi,tint,xc0);
  xc0 = xi(nsam+1,:);
  % augment vectors
  Y = [Y;yi(2:nsam+1)];
  UD = [UD;udi(2:nsam+1)];
end
if(kmax*nsam+1 < length(t))
   % compute tail of simulation from t(kmax*nsam) to t_end
k = kmax;
% calculate control and output of zoh
  ek = U(k*nsam+1) - Y(k*nsam+1);
  xd = Ad*xdk + Bd*ek;
  zoh = Cd*xdk + Dd*ek;
% integrate continuous-time plant with input of zoh
ti = t(k*nsam+1:length(t)); 
tint = ti-ti(1);  % again, needed for MATLAB 5.0
  udi = zoh*ones(length(ti),1);
  [yi,xi] = lsim(Ac,Bc,Cc,Dc,udi,tint,xc0);
% augment vectors
  Y = [Y;yi(2:length(yi))];
  UD = [UD;udi(2:length(udi))];
end