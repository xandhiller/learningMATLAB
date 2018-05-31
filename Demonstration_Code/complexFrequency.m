t = linspace(-10,10);
s = [-1-1i, -10-10i, -1-10i, 1i, 10i, 1, 10];

figure(1)
for k = 1:7
    plot(t, exp(s(k)*t))
    
    if k == 1
        hold on
    end
end
hold off