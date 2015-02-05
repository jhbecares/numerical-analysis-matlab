function f = funclorenz(t,x)
    a = 1; 
    b = 1; 
    c = 1; 
    d = 2; 
%     a = 0.4; 
%     b = 0.01; 
%     c = 0.3; 

% Probar con los metodos mieulertr o con miode45, o miab4
    sigma = 10; 
    ro = 0.1;
    % ro = 15; 
    % ro = 30;
    beta = 8/3;
    f1 = sigma*(x(2)-x(1));
    f2 = ro*x(1)-x(2)-x(1)*x(3);
    f3 = x(1)*x(2)-beta*x(3);
    f=[f1; f2; f3];
end
