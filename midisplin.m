 function [t, u] = midisplin (t0, tfin, a, b, N, C1, C2)
    % v(t,s) = v1(t)+s*v2(t)
    % Si hay solucion unica entonces s = (b-v1(T))/v2(T) y entonces
    % x = v1(t)+s*v2(t)
    % Nota: b = xT
    
    % Establecemos los valores de las condiciones iniciales 
    if (C1 == 0)
        cond_ini_v1 = [a, 0]; % v1(t0), v1'(t0) 
        cond_ini_v2 = [0, 1]; % v2(t0), v2'(t0) 
    else
        cond_ini_v1 = [0, a];
        cond_ini_v2 = [1, 0];
    end
    
    % mirk4(intervalo(1), intervalo(2), N, x0, f, []);
    [t2, v2] = mirk4(t0, tfin, N, cond_ini_v2, @funcdisplin2, []);
    
    if ((C1 == 0 && C2 == 0) || (C1 == 1 && C2 == 0))
        [t1, v1] = mirk4(t0, tfin, N, cond_ini_v1, @funcdisplin1, []);
        if (v2(1, N+1)~=0) % v2(T) != 0
            s = (b-v1(1, N+1))/v2(1, N+1);
            t = t1;
            u = v1+s*v2; 
        else % v2(T) = 0
            if (v1(1,N+1) == b) 
                t = t1;
                u = v1;
                printf('Error: El (PVIH) tiene Infinitas soluciones\n');
                printf('Tomamos la solucion con s=0\n');
            else
                t = nan;
                u = nan;
                printf('El problema no tiene solucion\n');
            end
        end
    end    
    if ((C1 == 0 && C2 == 1) || (C1 == 1 && C2 == 1) )
        [t1, v1] = mirk4(t0, tfin, N, cond_ini_v1, @funcdisplin1, []);
        if (v2(2, N+1)~=0) % v2'(T) != 0
            s = (b-v1(2, N+1))/v2(2, N+1);
            t = t1;
            u = v1+s*v2; 
        else % v2'(T) = 0
            if (v1(2,N+1) == b) 
                t = t1;
                u = v1;
                printf('Error: El (PVIH) tiene Infinitas soluciones\n');
                printf('Tomamos la solucion con s=0\n');
            else
                t = nan;
                u = nan;
                printf('El problema no tiene solucion\n');
            end
        end
    end     
end