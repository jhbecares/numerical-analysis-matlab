mispracticas                        % cargamos variables de entrada
itmax = 100;
[t,u] = mieulertr(intervalo(1), intervalo(2), N, x0, f, []);
misgraficas                        % imprimimos resultados