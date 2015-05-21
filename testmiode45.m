 mispracticas;
%  h = abs(intervalo(2)-intervalo(1))/N;
%  mallado = (intervalo(1):h:intervalo(2));
%  [tAux,uAux] = ode45(f, mallado, x0);
%  t = tAux.';
%  x = uAux.';
 
 [t,u] = miode45(f, intervalo, x0, N);
 misgraficas;