function y = funcdispnolin_2(t, x)
    %y = [x(2);feval(@mifunc, t, x); x(4); feval(@grad_y, t, x)*x(4)+feval(@grad_x, t, x)*x(3)];
    
    % Practica 24, (i)
    y = [x(2); -(x(2)*x(2))+x(1)+t];

    % Practica 24, (ii)
    % y = [x(2); 2*(x(1)*x(1)*x(1))];
    
    % Examen febrero
    if (x(1)~=0 || x(1) == 0)
        y = [x(2);2*sin(t*t)+2*t*sin(t*t)*x(2)];
    else
        y = [x(2); 2*sin(t*t)-4*t*t*log(x(1))*x(1)+2*t*sin(t*t)*x(2)];
    end
end