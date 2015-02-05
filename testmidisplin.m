%La llamada se realiza de la siguiente forma:
% midisplin (t0, tfin, x0, xT, C1, C2)

% Practica 22i):
% x''(t) = 4(x(t)-t), 0<=t<=1, x(0)=0, x(1)=2
% intervalo = [0,1];
% x0 = 0;
% xT = 2;
% C1 = 0;
% C2 = 0;

% Practica 22ii)
% x''(t) = 3x'(t)+2x(t)+2cos(t), 0<=t<=5, x(0)=-2, x'(5)=1
% intervalo = [0,5];
% x0 = -2;
% xT = 1;
% C1 = 0;
% C2 = 1;

% Practica 22iii)
%x''(t) = cos(t)x(t)+t, 0<=t<=10, x'(0)=-2, x(10)=-1
% intervalo = [0,10];
% x0 = -2;
% xT = -1;
% C1 = 1;
% C2 = 0;

% Practica 22iv)
% x''(t) = (1-sen(t))x'(t)+cos(t)x(t)+sen(t), 0<=10, x'(0)=-2, x'(10)=-1
intervalo = [0, 10];
x0 = -2;
xT = -1;
C1 = 1;
C2 = 1;
    
[t, u, resultado] = midisplin(intervalo(1), intervalo(2), x0, xT, C1, C2);

if (resultado == 1)
    disp('El problema de contorno no tiene solucion o son infinitas');
else  
    if (resultado == 0)
        disp('El problema de contorno tiene una unica solucion');

    else
        disp('El problema de contorno tiene infinitas soluciones. Se representara una de ellas. ');
    end
    
    hold on;
    plot(t, u(1,:), 'r');
    plot(t, u(2,:), 'g');
end
