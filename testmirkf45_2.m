%f=@funcexamen; x0 = [0]; intervalo = [0,8]; N=1000; itmax=10; par =[];
h0 = 10^(-3);
hmin = 10^(-3);
TOL = 10^(-3);
mispracticas;
[t,u, h, ERROR, rechazo, aceptado] = mirkf45_2(intervalo(1), intervalo(2), x0, h0, hmin, TOL, f); 
M=size(t,2);
for j=1:M 
        A = u(1,j);
        %%%%%%%%%%%%%%%%%%
        % Cambiar aqui la funcion exacta para pintar la diferencia...%
        %%%%%%%%%%%%%%%%%%
        B = 1/(2+sin(t(j)*t(j)*t(j))); % Funciona con funcprueba1
        %B = 1/(1-t(j)); % Funciona con funcprueba2
        
        y(j)=A-B;  
end 
figure('name','Graficas');
subplot(3,1,1);
title('Solucion aproximada');
plot (t(1:size(t,2)-1),u(1:size(u,2)-1),'r');
title('Grafica X-t');
subplot(3,1,2);
if (size(t,2) == size(ERROR,2))
    plot(t,ERROR,'r');
else
    plot(t(1:size(t,2)-1),ERROR,'r');
end
title('Grafica Errores-t');
subplot(3,1,3);
if (size(t,2)== size(ERROR,2))
    plot(t,h,'g');
else
    plot(t(1:size(t,2)-1),h,'g');
end
title('Grafica h-t');

figure('name','Diferencias');
plot(t,y,'b');

display('Numero de calculos rechazados:');
rechazo
display('Numero de calculos aceptados:');
aceptado