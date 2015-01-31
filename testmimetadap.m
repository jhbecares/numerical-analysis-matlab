mispracticas;    

TOL = 10^-3; % antes -5
FAC = 0.9;
FACMAX = 5;
HMAX = (intervalo(2)-intervalo(1)) / 10;
HMIN = 10^-5;
h0 = HMAX;
%metodo = @mirk4;
metodo = @mieuler;
orden = 1;

[t, u, h, ERROR] = mimetadap(intervalo(1), intervalo(2), N, x0, TOL, FAC, FACMAX, HMAX, HMIN, h0, metodo, orden, f, []);
figure(3);
plot(h);
title('Pasos empleados');
misgraficas;