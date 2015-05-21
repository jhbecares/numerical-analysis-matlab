function y = funcdispnolin(t, x)
    %y = [x(2);feval(@mifunc, t, x); x(4); feval(@grad_y, t, x)*x(4)+feval(@grad_x, t, x)*x(3)];
    y = [x(2);mifunc(t, x); x(4); grad_y(t, x)*x(4)+grad_x(t, x)*x(3)];
end