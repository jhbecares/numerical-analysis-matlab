%   testmidispnolin.m
%   Utiliza midispnolin.m, mirk4.m
%   Resuelve u" = f(t, u, u')
%   Condiciones de contorno en este archivo.

% % Practica 24, (i):
 intervalo = [1, 2];
 x0 = 0;
 xT = 2;
 C1 = 0;
 C2 = 0;

% Practica 24, (ii):
%  intervalo = [1, 2];
%  x0 = 1;
%  xT = -1;
%  C1 = 0; 
%  C2 = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[t, u, valido] = midispnolin(intervalo(1), intervalo(2), x0, xT, C1, C2);

if (valido == 1)
    disp('No se ha encontrado solucion para el problema.');
else
    hold on;
    plot(t, u(1,:), 'r');
    plot(t, u(2,:), 'g');
end

