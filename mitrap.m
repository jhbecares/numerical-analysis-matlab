
% ParÃ¡metros de entrada:
% jac : nombre del fichero con el jacobiano del segundo miembro de la EDO,
% Df
% itmax : numero maximo de iteraciones en el metodo de Newton
% Parametros de salida:
% t : vector fila de tiempos
% u : matriz con la aproximacion
% numfun: contador del numero de evaluaciones de la funcion.

function [t,u, numfun] = mitrap(t0, tFin, N, x0, fun, par, jac, itmax)
    
    h = (abs(tFin-t0))/N;
    tAux = (t0:h:tFin);
    t = tAux; % inicializacion del vector de tiempos
    u = zeros (length(x0), N+1);
    u(:,1) = x0;
    
    numfun = 0; % inicializacion del contador con las evaluaciones
    for i=1:N
        u(:,i+1) = newtonTrap(fun, jac, h, u(:,i), t(i), itmax);
    end
end


% añadir el número de iteraciones que doy
function zk1 = newtonTrap(fun, jac, h, xn, tn, itmax)
    tol = h*h*h;
    z = zeros(length(xn), itmax);
    z(:,1) = xn;
    const = xn + (h/2)*feval(fun, tn, xn);
    
    for i=1:itmax-1
       z(:,i+1) = z(:,i) + ((-z(:,i)+const + (h/2)*feval(fun, tn+h, z(:,i))).'/(eye(length(xn))-(h/2)*feval(jac, z(:,i)))).';
       if norm(z(:,i+1) - z(:,i)) < tol
           zk1 = z(:,i+1);
           return;           
       end
    end
    zk1 = z(:,itmax);
end





