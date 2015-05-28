 %f=@funcvanderpol; x0 = [0.1; 0.2]; intervalo = [0,10]; N = 50; % con N = 75
 % o N = 80 se producen oscilaciones espureas en vanderpol+mimilne
 %f=@funccorazon; x0 = [0; 2]; intervalo = [0,2*pi]; N = 1000;
 %f=@funcrigida; x0 = 0; intervalo = [0,pi/2]; N = 25;
 
 % Prueba de los apuntes, que funciona perfectamente 
f = @funcprueba1; x0 = 1/exp(1); intervalo = [0,8]; par = []; N = 50;

%f = @funcexamen1; x0 = 0; intervalo = [0,8]; N = 1000;