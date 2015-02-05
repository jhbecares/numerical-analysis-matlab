function f = funcduffing(t,x)
    alpha = 1;
    f=[x(2); x(1)-alpha*x(2)-x(1)*x(1)*x(1)];
end
