% Datos de entrada vienen dados por
%     [t0, tfin] intervalo de tiempo
%     x0 dato inicial
%     h0 paso inicial
%     hmin paso minimo (por ejemplo 10^-5)
%     TOL tolerancia del error (por ejemplo 10^-3)
%     fun la funcion de la EDO
% Datos de salida son:
%     t vector de tiempos
%     u tabla de valores de x(t(n))
%     H vector fila de pasos
%     ERROR vector fila de errores
%     rechazo El numero de veces que se rechaza el calculo
function [t, u, H, ERROR, rechazo, aceptado] = mirkf45_2(t0, tfin, x0, h0, hmin, TOL, fun)

    % TABLA DEL METODO
    A  = [[0,0,0,0,0,0];[1/4,0,0,0,0,0];[3/32,9/32,0,0,0,0];[1932/2197,-7200/2197,7296/2197,0,0,0];[439/216,-8,3680/513,-845/4104,0,0];[-8/27,2,-3544/2565,1859/4104,-11/40,0]];
    C  = [0,1/4,3/8,12/13,1,1/2];
    B  = [25/216,0,1408/2565,2197/4104,-1/5,0];
    BB = [16/135,0,6656/12825,28561/56430,-9/50,2/55];
    
    %..........................................................................
    % valores dados por la profesora
        %hmin = 10^(-5);
        hmax = (tfin-t0)/10;
        facmax = 5;
        fac = 0.9;
        %TOL = 10^(-5);
        p = 4; % Orden del metodo, necesario para la formula de lopt   
    %..........................................................................


    %inicializamos las variables K, u, t, h, n
    u(:,1) = x0;
    n=1;
    t(1)=t0;
    l=h0; %paso tentativo
    rechazo=0;
    aceptado = 0;
    
    K = zeros(length(x0), 6);
    
    while t(n) <= tfin
        H(n)=l;
        %nodo tentativo
        s(n+1)=t(n) + l;
        
        %calculamos los valores de K actuales
        for i=1:6
            taux = t(n)+C(i)*l;
            
            paux=0;
            for j=1:6                          %suma de aij*K
                paux = paux + A(i,j)*K(:,j);
            end
            paux = u(:,n)+l*paux;
            
            K(:,i) = feval(fun, taux, paux);
            
            clear paux;
            clear faux;
        end
        
        %calculamos el valor y(n+1), z(n+1)
            % primero el sumatorio de los B*K(i), y después el resto
        y(:,n+1)=zeros(length(x0),1);
        z(:,n+1)=zeros(length(x0),1);
        for i=1:6
            y(:,n+1) = y(:,n+1) + B(i)*K(:,i);
            z(:,n+1) = z(:,n+1) + BB(i)*K(:,i);
        end
        y(:,n+1) = u(:,n)+l*y(:,n+1);
        z(:,n+1) = u(:,n)+l*z(:,n+1);
        
        % Calculamos el ERR
        ERROR(n) = norm(z(:,n+1)-y(:,n+1), inf) / l;

        %calculamos lopt aquí para no perder la referencia a n
        l = min(hmax, l*min(facmax, fac*((TOL/(ERROR(n)))^(1/p))));
        
        %Casuistica para ver si aceptamos el paso
        if ERROR(n) > TOL                              %rechazo de calculos
            rechazo = rechazo + 1;
        else                                           %aceptamos calculos
            t(n+1)=s(n+1);
            u(:,n+1)=z(:,n+1);
            n=n+1;
            aceptado = aceptado + 1;
        end
        

        if l<hmin
            display('El paso es menor que hmin');
            display('El paso vale: ')
            l
            return;
        end
    end
end