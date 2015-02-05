function f = funccompet(t,x)
    a = 1; b = 1; c = 1; d = 0.2; e = 0.4;f = 0.0001;
    f=[a*x(1)-b*x(1)*x(2)-e*x(1)*x(1); -c*x(2)+d*x(1)*x(2)-f*x(2)*x(2)];
end
