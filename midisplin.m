function [t, u, tipoResult] = midisplin (t0, tfin, x0, xT, C1, C2)
    % ######### DATOS DE ENTRADA #########
    % [t0, tfin] reprenta el intervalo
    % x0: Valor para la condici�n de contorno en t0
    % xT: Valor para la condici�n de contorno en tfin
    % C1: (primera condici�n de contorno). 
        % Si C1 = 0 entonces u(t0)=a
        % Si C1 = 1 entonces u'(t0)=a
    % C2: (segunda condici�n de contorno)
        % Si C2 = 0 entonces u(tfin)=b
        % Si C2 = 1 entonces u'(tfin)=b
   
    % ######### DATOS DE SALIDA #########
    % t = vector de nodos que se utilizan
    % u = valores en cada nodo
    % tipoResult: representa el n�mero de soluciones del problema de
    % contorno. 
        % Si tipoResult = 0, entonces �nica soluci�n
        % Si tipoResult = 1, entonces no hay soluci�n
        % Si tipoResult = 2, m�ltiples soluciones
     
    % Funciones extra que utiliza:
        % mirk4, que implementa Runge-Kutta de orden 4
        % funcdisplin1, devuelve u'' = p*u'+q*u+r
        % funcdisplin2, devuelve u'' = p*u'+q*u
        % p.m, q.m y r.m, funciones necesarias para resolver
            % funcdisplin1 y funcdisplin2
            
    % Inicializaciones:
    tipoResult = 0; % Empezamos suponiendo que tiene una �nica soluci�n.
    N = 100;
    
    if (C1 == 0)
        x0_1 = [x0, 0];
        x0_2 = [0, 1];
    else
        x0_1 = [0, x0];
        x0_2 = [1, 0];
    end

    % Resolvemos el sistema cuasihomog�neo:
    f_hom = @funcdisplin2;
    [t, y1] = mirk4(t0, tfin, N, x0_2, f_hom, []);
    
    % Comprobamos existencia y unicidad
    if (C2 == 0)
        if (y1(1, N+1) == 0)
            tipoResult = 1; % -> no hay soluci�n
        else
            tipoResult = 0; % -> existe soluci�n y es �nica
        end
    else
        if (y1(2, N+1) == 0)
            tipoResult = 1;
        else
            tipoResult = 0;
        end
    end
    
    % Si hay una soluci�n �nica, seguimos calculando para el problema no
    % homog�neo
    if (tipoResult == 0) 
       f_no_hom = @funcdisplin1;
       [t, y2] = mirk4(t0, tfin, N, x0_1, f_no_hom, []);
       
       % Sabemos que v(T, s) = v1(T) + sv2(T) = b
       if (C2 == 0)
          s = (xT - y2(1, N+1)) / y1(1, N+1); 
       else
          s = (xT - y2(2, N+1)) / y1(2, N+1);
       end
       
       u = y2 + s*y1;
    else
        % En caso de tener infinitas soluciones, tomamos nuestro s
        % arbitrario como s = 1. 
        if (C2 == 0) 
            if (y1(1, N+1) == xT)
               tipoResult = 2;
               u = y1;
            end
        else
            if (y1(2, N+1) == xT)
               tipoResult = 2;
               u = y1;
            end
        end
    end
    
    % Si no ten�a soluci�n, asignamos u=0.
    if (tipoResult == 1)
        u = 0; %Asignamos algo para que no de error
    end;
end












