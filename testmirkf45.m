mispracticas                        % cargamos variables de entrada
h0 = 10^(-3);
hmin = 10^(-3);
TOL = 10^(-3);
[t,u, H, ERROR, rechazo, acep] = mirkf45(intervalo(1), intervalo(2), x0, h0, hmin, TOL, f);
display('Numero de calculos aceptados:');
acep
display('Numero de calculos rechazados:');
rechazo


figure(3);
plot(t, H);
title('Pasos empleados');

% Pintamos la diferencia entre la solucion exacta (B) y la aproximada
M=size(u,2);
for j=1:M
     
        A = u(1,j);
        %B = exp(-cos(t(j)*t(j))); % va con funcprueba1
        B = 1/(2+sin(t(j)*t(j)*t(j))); % va con la funcion del examen se supone
        y(j)=abs(A-B); 

end
figure(4);
size(t)
size(y)
plot(t,y,'b');
title('Diferencias');


misgraficas                        % imprimimos resultados
ERROR