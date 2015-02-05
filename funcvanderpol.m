function f = funcvanderpol(t,x)
    alpha = 10;
    beta = 1;
    f=[x(2);-x(1)+alpha*(beta-x(1)*x(1))*x(2)];
end

