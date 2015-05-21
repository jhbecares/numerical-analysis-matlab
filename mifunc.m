function y = mifunc(t, x)
    %24a)
     %y = -(x(2)*x(2))+x(1)+t;
    %24b)
    %y = 2*x(1)*x(1)*x(1);
    
    
    % examen
    %y = -3*t*t*cos(t*t*t)*(x(1)*x(1));
   
    if (x(1)~=0 || x(1) == 0)
        y = 2*sin(t*t)+2*t*sin(t*t)*x(2);
    else
        y = 2*sin(t*t)-4*t*t*log(x(1))*x(1)+2*t*sin(t*t)*x(2);
    end
    
   
end