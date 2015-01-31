mispracticas                        % cargamos variables de entrada
itmax = 100;
[t,u, numfun] = mitrap(intervalo(1), intervalo(2), N, x0, f, [], jacobianofunvanderpol, itmax);
misgraficas                        % imprimimos resultados