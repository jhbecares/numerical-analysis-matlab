%f=@funcexamen; x0 = [0]; intervalo = [0,8]; N=1000; itmax=10; par =[];
h0 = 10^(-3);
hmin = 10^(-3);
TOL = 10^(-3);
mispracticas;
[t,u, h, ERROR, rechazo, aceptado] = mirkf45_2(intervalo(1), intervalo(2), x0, h0, hmin, TOL, f); 
M=size(t,2);
for j=1:M 
        A = u(1,j);
        B = 1/(2+sin(t(j)*t(j)*t(j)));
        y(j)=A-B;  
end 
figure('name','Graficas');
subplot(3,1,1);
title('Solucion aproximada');
plot (t,u,'r');
title('Grafica X-t');
subplot(3,1,2);
plot(t(1:size(t,2)-1),ERROR,'r');
title('Grafica Errores-t');
subplot(3,1,3);
plot(t(1:size(t,2)-1),h,'g');
title('Grafica h-t');

figure('name','Diferencias');
plot(t,y,'b');

display('Numero de calculos rechazados:');
rechazo
display('Numero de calculos aceptados:');
aceptado