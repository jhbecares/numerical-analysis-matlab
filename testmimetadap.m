mispracticas;    

TOL = 10^-3; % antes -5
FAC = 0.9;
FACMAX = 5;
HMAX = (intervalo(2)-intervalo(1)) / 10;
HMIN = 10^-5;
h0 = HMAX;

metodo = @mirk4; orden = 4;
%metodo = @mieuler; orden = 1;


[t, u, h, ERROR] = mimetadap(intervalo(1), intervalo(2), N, x0, TOL, FAC, FACMAX, HMAX, HMIN, h0, metodo, orden, f, []);

% Pintamos los pasos empleados en funcion del tiempo
figure(3);
plot(t, h);
title('Pasos empleados');

% % Pintamos la diferencia entre la solucion exacta (B) y la aproximada
% M=size(u,2);
% for j=1:M
%      
%         A = u(1,j);
%         B = exp(-cos(t(j)*t(j)));
%         y(j)=abs(A-B); 
% 
% end
% figure(4);
% plot(t,y,'b');
% title('Diferencias');


misgraficas;