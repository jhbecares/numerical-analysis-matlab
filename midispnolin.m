function [t, u, tipoResult] = midispnolin (t0, tfin, x0, xT, C1, C2)
    TOL = 10^(-3);
    N = 100;
    num = 1;
    fin = 0;
    
    
    if (C1 == 0)
       if (C2 == 0)
           % ==== En este caso, las condiciones de contorno son las
           % siguientes: u(t0)=a, u(tfin)=b
           % En primer lugar, resolver el método de disparo requiere
           % resolver el PVI siguiente:
           % v''(t)= f(t, v(t), v'(t)), t in [t0,T]
           % v(t0) = a, v'(t0) = s
           
           % Escogemos s0 = (b-a)/(T-t0) y s1 = s0+ (b-x(s0,T))/(T-t0)
           s0 = (xT - x0)/(tfin - t0);
           f = @funcdispnolin; 
           
           x0_1 = [x0, s0];   
           [tkAux, uAux] = mirk4(t0, tfin, N, x0_1, f, []);
           s1 = s0 + (x0 - uAux(1, N+1))/(tfin-t0); 
           
           while (fin == 0)
               x0_2 = [x0, s1];
               [tkAux, ukAux] = mirk4(t0, tfin, N, x0_2, f, []);
               
               if (abs(ukAux(1, N+1) - tfin) <= TOL)
                   fin = 1;
               else
                   sAux = s1;
                   s1 = s1 - ((ukAux(1, N+1)-xT)*(s1-s0))/(ukAux(1, N+1) - uAux(1, N+1));
                   s0 = sAux;
                   uAux = ukAux;
                   num = num+1; % Hemos completado una vuelta más
                   % Esta variable num esta pensada para evaluar un maximo
                   % de vueltas y parar.
               end  
           end
           
           t = tkAux;
           u = ukAux;
           tipoResult = 0;
       else
           % C2 = 1
       end
    else 
        % C1 = 1
    end

end