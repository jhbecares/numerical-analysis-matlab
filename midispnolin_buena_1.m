function [t, u] = midispnolin_buena_1 (t0, tfin, a, b, C1, C2, N, TOL)
  
    s0 = (b-a)/(tfin-t0);
    sAux = s0;
    uAux(:,1)=[s0,a,1,0];
    cont = true;
    num = 1;
    while (cont)
        %  mirk4 (t0, tfin, N, x0, f, par)
        
        
        if (C1 == 0)
            [tAux, uAux] =  mirk4(t0, tfin, N, [a,s0,0,1], @funcdispnolin,[]);
        else 
            [tAux, uAux] =  mirk4(t0, tfin, N, [s0,a,1,0], @funcdispnolin,[]);
        end
        
        s0 = s0 - (uAux(1,N+1)-b)*(s0-sAux)/(uAux(4, N+1));
        
        if (C2 == 0)
            if (abs(uAux(1,N+1)-b) < TOL || num > 50)
                cont = false;
            end
        else
            if (abs(uAux(2,N+1)-b) < TOL || num > 50)
                cont = false;
            end
        end
        
        
        num = num+1
        
        %m = max(abs(uAux(1,N+1)-b));
    end
    uAux
    t = tAux;
    u = uAux;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    
end