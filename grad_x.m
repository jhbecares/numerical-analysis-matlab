function y = grad_x(t, x)
    % 24a)
    %y = [x(2), -x(2)*x(2)+x(1)+t];
    %y = x(2);
    %y = -2*x(2)*x(3)+x(2)+1;
    % 24b)
    % y = [x(2), 2*x(1)*x(1)*x(1)];
    %y = x(2);
    %y = 6*x(1)*x(1)*x(2);
    
    if (x(1)~=0 || x(1) == 0)
        y = 2*t*sin(t*t)*x(3)+x(2)*(-4*t*t+2*sin(t*t)+4*t*t*cos(t*t))+4*t*cos(t*t);
    else 
        y = 2*t*sin(t*t)*x(3)+x(2)*(-4*t*t-4*t*t*log(x(1))+2*sin(t*t)+4*t*t*cos(t*t))+x(1)*(-8*t*log(x(1)))+4*t*cos(t*t);
    end
  
end