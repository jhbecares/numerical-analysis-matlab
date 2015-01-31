function [t,u] = pruebamiab4am3(t0, tFin, N, x0, fun, par)
    % Tenemos que implementar el m�todo de Adams-Bashforth de 4 pasos
    % como predictor, y el m�todo de Adams - Moulton de 3 pasos como 
    % corrector. El m�todo se inicializar� con el de Runge-Kutta de orden 4
    
    % Adams-Moulton de 3 pasos
    % xn+3 = xn+2 + (h/24)*(9*fn+3 + 19*fn+2 - 5*fn+1 + fn)   , n=0,...,N-3
    % x0 dado
    % x1, x2 se calcula mediante Runge-Kutta de orden 4
    % Posteriormente usamos AB como predictor y AM como corrector.
    
    h = (abs(tFin-t0))/N;
    tAux = (t0:h:tFin);
    t = tAux.';
    u = zeros (N+1, length(x0));
    u(1,:) = x0.';
    
    %C�lculo de x1 y x2
    [~, uTemp] = mirk4(t0+h, t0+3*h, 3, x0, fun, par); 
    for i=2:4
       u(i,:) = uTemp(i,:);
    end
    
    for i = 4:N
        % Predictor: Adams-Bashford de 4 pasos
        % xn+4 = xn+3 + (h/24)*(55*fn+3 - 59*fn+2 + 37*fn+1 - 9*fn), 
        % x0, x1, x2, x3 dados
        % N=0,...,N-4
       fn3 = feval(fun, t(i), u(i,:)).';
       uAux = u(i,:) + (h/24)*(55*fn3 - 59*u(i-1,:) + 37*u(i-2,:) - 9*u(i-3,:));
       
       % Corrector: Adams-Moulton de 3 pasos
       % xn+3 = xn+2 + (h/24)*(9*fn+3 + 19*fn+2 - 5*fn+1 + fn),
       % x0, x1, x2 dados
       % N=0,...,N-3
       fn3 = feval(fun, t(i+1), uAux).';
       fn2 = feval(fun, t(i), u(i,:)).';
       fn1 = feval(fun, t(i-1), u(i-1,:)).';
       fn = feval(fun, t(i-2), u(i-2,:)).';
       u(i+1,:) = u(i,:) + (h/24)*(9*fn3 + 19*fn2 - 5*fn1 + fn);
    end
    
end