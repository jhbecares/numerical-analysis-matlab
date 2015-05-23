 function [t, u] = miab4 (t0, tfin, N, x0, f, par)
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
    fun(:,1) = feval(f,t(1),u(:,1));
    % Inicializaciones
    [tAux, uAux] = mirk4(t0, t0+3*h, 3, x0, f, par);
    
    % Suponemos que tenemos ya desde u(:,1) hasta u(:,4)
    for i=2:4
        u(:,i) = uAux(:,i);
        fun(:,i) = feval(f,t(i),u(:,i));
    end
    for i=4:N
        aux1 = 55*fun(:,i);
        aux2 = -59*fun(:,i-1);
        aux3 = 37*fun(:,i-2);
        aux4 = -9*fun(:,i-3);
        u(:,i+1) = u(:,i)+ (h/24)*(aux1 + aux2 + aux3 + aux4);
        fun(:,i+1) = feval(f,t(i+1),u(:,i+1));
    end
    %u(:,N+1)
end