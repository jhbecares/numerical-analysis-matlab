function f = funcdisplin2 (t, x)
    f = [x(2); feval(@p,t)*x(2)+feval(@q,t)*x(1)];
end