function f = funcdeppresa(t,x)
    a = 1; 
    b = 1; 
    c = 1; 
    d = 2; 
%     a = 0.4; 
%     b = 0.01; 
%     c = 0.3; 

% Probar con los metodos mieulertr o con miode45, o miab4
    f=[a*x(1)-b*x(1)*x(2); -c*x(2)+d*x(1)*x(2)];
end
