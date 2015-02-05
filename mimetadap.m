function [t,u,h,ERROR] = mimetadap(t0, tfin, N, x0, TOL, FAC, FACMAX, HMAX, HMIN, h0, metodo, orden, f, p)

    h = h0;
    t = t0;   
    u = x0;
    P = orden;
    
    FALLO = false;
    ERROR = 0;
    i = 1;
   while (t(i) < tfin && not(FALLO))
        [~, x] = feval(metodo, t(i), t(i)+h(i), 2, u(:,i), f, p);
        [~, y] = feval(metodo, t(i), t(i)+h(i), 1, u(:,i), f, p);
        
        ERRaux = norm(x(:,3)-y(:,2))/h(i);
        %ERRaux = norm(x(:,3)-y(:,2), inf)/(1-(1/(2^P)));
        
        if (ERRaux <= TOL)
            u = [u, x(:,3)];
            t = [t, t(i) + h(i)];
            ERROR = [ERROR, ERRaux];
            i = i+1;
        end
        
        if ERRaux > 0
            if (ERRaux <= TOL)
                % Accedemos a h(i-1) porque ya hemos aumentado i
                h = [h, min([HMAX, h(i-1)*min([FACMAX, FAC*((TOL/ERRaux)^(1/(P)))])])];
             else
                 h = [h(1:i-1), min([HMAX, h(i)*min([FACMAX, FAC*((TOL/ERRaux)^(1/(P)))])])]; % antes habia un h(1:i-1)
             end
        else
             h = [h, min([HMAX, h(i-1)*min([FACMAX, FAC*((TOL/ERRaux)^(1/(P)))])])];
        end
        if h(i) < HMIN
            FALLO = true;
        end
   end
end