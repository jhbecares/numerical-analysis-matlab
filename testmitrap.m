mispracticas;
itmax = 10;
%jac = @jacobianovanderpol;
%jac = @jacobianocorazon;
jac = @jacobianorigida;
[t, u, numfun] = mitrap(intervalo(1), intervalo(2), N, x0, f, jac, itmax, []); 
%print('Numero de evaluaciones de la funcion:')

numfun
misgraficas;