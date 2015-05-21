function y = funcvanderpol(t, x)
    y = [x(2); -x(1)-(x(1)*x(1)-1)*x(2)];
end

