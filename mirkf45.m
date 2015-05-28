function [t, u, H, ERROR, rechazo, acep] = mirkf45(t0, tfin, x0, h0, hmin, TOL, fun)
% Metodo de Runge-Kutta-Fehlberg

% t0: tiempo inicial
% tfin: tiempo final T
% x0: valor inicial
% h0: paso inicial
% hmin: paso minimo (por ejemplo hmin=10^{-5})
% TOL: tolerancia para el error local (por ejemplo 10^{-3})
% fun: f(t,x), funcion de la E.D.O.

% Variables opcionales de salida
% H: un vector fila de pasos,
% ERROR: un vector fila de errores,
% rechazo: el numero de veces que se rechaza el calculo

    % valores dados por la profesora
    hmin = 10^(-5);
    hmax = (tfin-t0)/10;
    facmax = 5;
    fac = 0.9;
    TOL = 10^(-5);
    p = 4; % Orden del metodo, necesario para la formula de lopt
    
    % Inicializamos u
    u(:,1) = x0;
    % Inicializamos n y t(1)
    n=1;
    t(:,1) = t0;
    % Resto de inicializaciones
    l = h0;
    H(1) = h0;
    fin = 0;
    rechazo = 0;
    
    while (t(:,n) < tfin) && (fin == 0)
        s(:,n+1) = t(:,n) + l; % Calculamos el nodo tentativo
        
        h = l;
        K1 = feval(fun,t(:,n),u(:,n));     
        K2 = feval(fun,t(:,n)*(1/4),u(:,n)+h*(1/4)*K1);
        K3 = feval(fun,t(:,n)*(3/8),u(:,n)+h*(3/32)*K1+h*(9/32)*K2);
        K4 = feval(fun,t(:,n)*(12/13),u(:,n)+h*(1932/2197)*K1-h*(7200/2197)*K2+h*(7296/2197)*K3);
        K5 = feval(fun,t(:,n)*(1),u(:,n)+h*(439/216)*K1-h*(8)*K2+h*(3680/513)*K3-h*(845/4104)*K4);
        K6 = feval(fun,t(:,n)*(1/2),u(:,n)-h*(8/27)*K1+h*(2)*K2-h*(3544/2562)*K3+h*(1859/4104)*K4-h*(11/40)*K5);

        % Es necesario calcular los metodos si ya tenemos el error?
        % Metodo interno -> Estimamos la aproximacion
        xn1(:,n+1) = u(:,n) +h*((25/216)*K1 + (1408/2565)*K3 + (2197/4104)*K4 - (1/5)*K5);
        % Metodo externo -> Sirve para estimar el error local relativo
        xn1g(:,n+1) = u(:,n) + h*((16/135)*K1 + (6656/12825)*K3 + (28561/56430)*K4 - (9/50)*K5 + (2/55)*K6);
        
        ERRH = norm((1/360)*K1-(128/4275)*K3-(2197/75240)*K4+(1/50)*K5+(2/55)*K6);
        ERROR(:,n) = ERRH;
        
        if ERRH > TOL
            % Rechazamos los calculos
            rechazo = rechazo + 1;
            lopt = min(hmax, l*min(facmax, fac*(TOL/(ERROR(:,n)))^(1/p)));
        else
            % Aceptamos los calculos
            t(:,n+1) = s(:,n+1);
            u(:,n+1) = xn1(:,n+1);
            n=n+1;
            lopt = min(hmax, l*min(facmax, fac*(TOL/(ERROR(:,n-1)))^(1/p)));
        end;
        
        % Cambiamos el valor del paso por el nuevo paso optimo calculado
        l = lopt;
        H(:,n) = l;
        
        if lopt < hmin
            % Paramos el algoritmo si el paso es menor que el minimo
            % aceptado
            fin = 1;
        end;
        
    end;
    %Devolvemos el numero de calculos que se han aceptado
    acep = n - rechazo;
    clear xn1g;
    clear s;
end
