% mirk4.m
% Implementa el m�todo de Runge-Kutta cl�sido de orden 4,
% evaluando la funci�n de la EDO 
% de un fichero externo

function [t,u] = mirk4(t0, tFin, N, x0, fun, par)
% Necesitamos calcular las pendientes en 4 puntos distintos (por eso
% se denomina de orden 4). Para ello tenemos que calcular K1, K2, 
% K3 y K4, que eval�an la funci�n con distintos argumentos para despu�s
% pasarle el valor final de la pendiente al c�lculo del punto actual
% en funci�n del valor del punto anterior y la pendiente calculada

    h = (abs(tFin-t0))/N;
    tAux = (t0:h:tFin);
    t = tAux;
    u = zeros (length(x0), N+1);
    u(:,1) = x0;
    
    for i=1:N
       k1 = feval(fun, t(i), u(:,i));
       k2 = feval(fun, t(i)+h/2, u(:,i)+(h*k1)/2);
       k3 = feval(fun, t(i)+h/2, u(:,i)+(h*k2)/2);
       k4 = feval(fun, t(i)+h, u(:,i)+h*k3);
       u(:,i+1) = u(:,i) + (h*(k1+2*k2+2*k3+k4))/6;
    end

end

