function Df = jacobianovanderpol(t, x)
    Df = [0, 1; -1+2*x(1)*x(2), 1+x(1)*x(1)];
end

