function [t, u, s, num] = midispnolin (t0, tfin, a, b, C1, C2, N, TOL)
  
    s(1) = (b-a)/(tfin-t0);
    s1 = s(1)
    sAux = s(1);
    uAux(:,1)=[s(1),a,1,0];
    
    if (C1== 0)
        [tAux, uAux] =  mirk4(t0, tfin, N, [a,s(1),0,1], @funcdispnolin,[]);
        s(2) = s(1)+(b-uAux(1,N+1))/(tfin-t0);
    else
        [tAux, uAux] =  mirk4(t0, tfin, N, [s(1),a,1,0], @funcdispnolin,[]);
        s(2) = s(1)+(b-uAux(2,N+1))/(tfin-t0);
    end
    
    cont = true;
    num = 3;
    while (cont)
        
        if (C1 == 0)
            [tAux, uAux] =  mirk4(t0, tfin, N, [a,s(num-1),0,1], @funcdispnolin,[]);
            s(num) = s(num-1)-(uAux(1,N+1)-b)*(s(num-1)-s(num-2))/(uAux(3, N+1));

        else 
            uant = uAux;
            
            [tAux, uAux] =  mirk4(t0, tfin, N, [s(num-1),a,1,0], @funcdispnolin,[]);
            s(num) = s(num-1)-(uAux(1,N+1)-b)*(s(num-1)-s(num-2))/(uAux(1, N+1)-uant(1,N+1));
        end
        s(num)
        %s(num) = s(num-1)-(uAux(1,N+1)-b)*(s(1)-sAux)/(uAux(4, N+1));
        %s(num) = s(num-1)-(uAux(1,N+1)-b)*(s(num-1)-s(1))/(uAux(3, N+1));
        %s(num) = s(num-1)-(uAux(1,N+1)-b)*(s(num-1)-s(1))/(tfin-t0);

        
        if (C2 == 1)
            if (abs(uAux(1,N+1)-b) <= TOL || num > 50)
                cont = false;
            end
        else
            if (abs(uAux(2,N+1)-b) <= TOL || num > 50)
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