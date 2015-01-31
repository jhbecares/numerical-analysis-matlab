mispracticas                        % cargamos variables de entrada
h0 = 10^(-3);
hmin = 10^(-3);
TOL = 10^(-3);
[t,u, H, ERROR, rechazo, acep] = mirkf45(intervalo(1), intervalo(2), x0, h0, hmin, TOL, f);
display('Numero de calculos aceptados:');
acep
display('Numero de calculos rechazados:');
rechazo
misgraficas                        % imprimimos resultados
