% mieuler.m
% Implementa el método de Euler, evaluando la función de la EDO 
% de un fichero externo

function [t,u] = mieuler(t0, tFin, N, x0, fun, params)
    h = (abs(tFin-t0))/N;
    tAux = (t0:h:tFin);
    t = tAux;
    u = zeros (length(x0), N+1);
    u(:,1) = x0;
    
    for i=1:N
       xn = (feval (fun, t(i), u(:,i)));
       xnm1 = u(:,i) + h * xn;
       u(:, i+1) = xnm1;
    end
end