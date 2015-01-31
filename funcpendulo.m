function f = funcpendulo(t, x)
    %beta =    0;
    %beta = 0.25;
    beta =  1.5;
    %beta =  1/2;

    M =   0;
    %M = 0.9;
    %M =   1;
    %M = 1.1;
    f = [x(2); M - 2 * beta * x(2) - 9.8 * sin(x(1))];
end



