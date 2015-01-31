%       testmieuler.m
%
%       Resolucion de EDIFs utilizando mimilsimp.m:
%       [Implementacion del metodo de prediccion(Milne)-correccion(Simpson) para la resolucion de EDIFs]
%
%       Utiliza:
%           mispracticas.m
%           misgraficas.m
%           mimilsimp.m



mispracticas;             
[t, u] = mimilsimp(intervalo(1), intervalo(2), N, x0, f, []);  
misgraficas;                 
