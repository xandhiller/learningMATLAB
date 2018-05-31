clear all;
close all;

% Constants

Dc = 627.8;     % Design Cost
Ic = 100000;    % Investment cost
Ac = 5000;      % Advertising cost
Fc = Ic + Dc + Ac;   % Total fixed cost
Uc = 83.7725;   % Unit production cost

Rp = @(u) (Fc + u*Uc)/u;    % Retail price as a function of units sold (u).
Rp_interval = [1000 4000 0 250];

% Plot Retail price vs units sold (u)
figure(1)
fplot(Rp)
axis(Rp_interval);
hold on;
plot(3000, 118.99, '*r'); % Highlights our point of interest
grid on;
ylabel('Retail price (AUD)');
xlabel('Units sold');

Us = 118.99; % Retail cost of product 

% Now we have determined our retail price based on a normal number of
% units.

Rev = @(u) Us*u; % Revenue
MoneySpent = @(u) Uc*u+Fc;
FixedCost = @(u) Fc;

BreakevenAxes = [0 6000 0 700000];

figure(2);
fplot(Rev, 'Color', 'g', 'Linestyle', '-' ,'LineWidth', 3);
hold on;
fplot(MoneySpent, 'Color', 'r', 'Linestyle', '-' ,'LineWidth', 3);
hold on;
fplot(FixedCost,'Color', 'm', 'Linestyle', '--' ,'LineWidth', 3);
hold on;
plot(3000, 356982.8, '*b', 'LineWidth', 5);
axis(BreakevenAxes);
grid on; 
ylabel('AUD');
xlabel('Units sold');
legend('Revenue','Money Spent','Fixed Cost', 'Break Even Point');








