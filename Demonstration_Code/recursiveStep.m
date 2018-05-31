figure(1)
lim = 10;
x = [1:lim];
for i = 1:lim
    
    if i == 2
        hold on
    end
    
    y = tf([i],[1,(1/x(i))*i,i]);
    impulse(y, 'k')

    if i == lim
        hold off
    end
end
    