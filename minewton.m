function [ti1, ui1] = minewton(t0, tFin, N, x0, fun, jac, itmax)
    % Implementación del método de Newton para el cálculo de soluciones.
    h = (abs(tFin-t0))/N;
    tAux = (t0:h:tFin);
    ti1 = tAux; % inicializacion del vector de tiempos
    ui1 = zeros (length(x0), N+1);
    ui1(:,1) = x0;
    
    for i=1:itmax
        %ui1 = ... 
        
        if norm(ui1 - x0) < h*h
           break; 
        else
            x0 = ui1;
        end
    end 
    
end

