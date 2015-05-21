 function [t, u] = mirk4 (t0, tfin, N, x0, f, par)
    % ENTRADA
    % t0 = tiempo inicial
    % tfin = tiempo final T
    % N = Numero de pasos
    % x0 = valor inicial, vector columna
    
    % f(t,x) funcion de la EDO
    % par = variable de entrada con parametros.
    
    % SALIDA
    % t = vector fila de tiempos t(n)
    % u = tabla de valores de x(t(n))
    
    h = (tfin - t0)/N; % paso
    t = (t0:h:tfin); % mallado de puntos
    u = zeros(length(x0), N+1);
    
    u(:,1) = x0; % Incorporamos el dato inicial
    for i=1:N
       K1 = feval(f, t(i), u(:,i));
       K2 = feval(f, t(i)+h/2, u(:,i)+(h/2)*K1);
       K3 = feval(f, t(i)+h/2, u(:,i)+(h/2)*K2);
       K4 = feval(f, t(i)+h, u(:,i)+h*K3);
       %[K1,       K2,       K3,       K4]   
       u(:,i+1) = u(:,i)+(h/6)*(K1+2*K2+2*K3+K4);
    end
    %u(:,N+1)
end