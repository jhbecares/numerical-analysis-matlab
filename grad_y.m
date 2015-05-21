function y = grad_y(t, x)
    % 24a)
    %y = [x(2), -x(2)*x(2)+x(1)+t];
    %y = -x(2)*x(2)+x(1)+t;
   % y = -2*x(2)*x(3)+x(2);
    % 24b)
   %  y = [x(2), 2*x(1)*x(1)*x(1)];
   %y = 2*x(1)*x(1)*x(1);
  % y = 6*x(1)*x(1)*x(2);
   
   if (x(1)~=0 || x(1) == 0)
       %y = (2*t*sin(t*t)*x(2));
       y = -4*t*t*(x(2))+2*t*sin(t*t)*x(3);
   else
       %y = (2*sin(t*t)-4*t*t*log(x(1)))*x(1)+2*t*sin(t*t)*x(2);
       y = -4*t*t*(x(2)+log(x(1))*x(2))+2*t*sin(t*t)*x(3);
   end
end