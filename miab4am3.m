function [t,u] = miab4am3(t0, tFin, N, x0, fun, par)
    % Tenemos que implementar el metodo de Adams-Bashforth de 4 pasos
    % como predictor, y el metodo de Adams - Moulton de 3 pasos como 
    % corrector. El metodo se inicializara con el de Runge-Kutta de orden 4
    
    % Adams-Moulton de 3 pasos
    % xn+3 = xn+2 + (h/24)*(9*fn+3 + 19*fn+2 - 5*fn+1 + fn)   , n=0,...,N-3
    % x0 dado
    % x1, x2 se calcula mediante Runge-Kutta de orden 4
    % Posteriormente usamos AB como predictor y AM como corrector.
    
    h = (abs(tFin-t0))/N;
    tAux = (t0:h:tFin);
    t = tAux;
    u = zeros (length(x0), N+1);
    f = zeros(length(x0), N+1);
    
    u(:,1) = x0;
    f(:,1) = feval(fun, t(1), u(:,1));
    
    %Calculo de x1 y x2
    [~, uTemp] = mirk4(t0+h, t0+3*h, 3, x0, fun, par); 
    for i=2:4
       u(:,i) = uTemp(:,i);
       f(:,i) = feval(fun, t(i), u(:,i));
    end
    
    for i = 4:N
        % Predictor: Adams-Bashford de 4 pasos
        % xn+4 = xn+3 + (h/24)*(55*fn+3 - 59*fn+2 + 37*fn+1 - 9*fn), 
        % x0, x1, x2, x3 dados
        % N=0,...,N-4
       uAux = u(:,i) + (h/24)*(55*f(i) - 59*u(:,i-1) + 37*u(:,i-2) - 9*u(:,i-3));
       
       % Corrector: Adams-Moulton de 3 pasos
       % xn+3 = xn+2 + (h/24)*(9*fn+3 + 19*fn+2 - 5*fn+1 + fn),
       % x0, x1, x2 dados
       % N=0,...,N-3
       
       f(:,i+1) = feval(fun, t(i+1), uAux);
       u(:,i+1) = u(:,i) + (h/24)*(9*f(:,i+1) + 19*f(:,i) - 5*f(:,i-1) + f(:,i-2));
       
    end
    
end