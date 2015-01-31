mispracticas  % Cargamos el nombre de la función (f), los valores iniciales
              % (x0), el inicio y fin del intervalo y el N.
h = abs(intervalo(2)-intervalo(1))/N;
mallado = (intervalo(1):h:intervalo(2));

[tAux,uAux] = ode45(f, mallado, x0);    % Le pasamos la función, el mallado de
                                  % puntos y los valores iniciales

t=tAux.';
u=uAux.';

misgraficas  % Dibujamos la gráfica correspondiente a 1, 2 o 3 coords. 
