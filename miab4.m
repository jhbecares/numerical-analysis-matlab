function [t,u] = miab4 (t0, tFin, N, x0, fun, par)
    % implementacion del metodo de Adams-Bashford de 4 pasos
    % la inicializacion del metodo se realiza mediante el metodo de Runge-Kutta
    % Necesitamos aproximar x1 (~x(t1)), x2, x3
    % Por tanto usamos el intervalo [t0, t3], siendo t3=t0+3*h, y n=3

    % Tomamos los valores iniciales con Runge-Kutta
    h = (abs(tFin-t0))/N;
    tAux = (t0:h:tFin);
    t = tAux; % inicializacion del vector de tiempos
    u = zeros (length(x0), N+1);
    u(:,1) = x0;

    % Calculamos x1,x2,x3
   [tAux,uAux] = mirk4(t0, t0+3*h, 3, x0, fun, []);
   for i=2:4
       u(:,i) = uAux(:,i);
   end
   
   % Las hacemos fuera para que luego no se repitan las evaluacione
   evalfun = zeros(length(x0), N+1);
   evalfun(:,1) = feval(fun, t(1), u(:,1));
   evalfun(:,2) = feval(fun, t(2), u(:,2));
   evalfun(:,3) = feval(fun, t(3), u(:,3));
   
   for i=4:N
       evalfun(:,i) = feval(fun, t(i), u(:,i));
       a1 = 55*evalfun(:,i);
       a2 = -59*evalfun(:,i-1);
       a3 = 37*evalfun(:,i-2);
       a4 = -9*evalfun(:,i-3);
       u(:,i+1) = u(:,i) + (h/24)*(a1+a2+a3+a4);
   end

end
