function [t,u] = mieulertr(t0, tFin, N, x0, fun, par)
    h = (abs(tFin-t0))/N;
    tAux = (t0:h:tFin);
    t = tAux;
    u = zeros (length(x0), N+1);
    u(:,1) = x0;
    
    for i=1:N
       % Metodo de euler (predictor)
       xn = (feval (fun, t(i), u(:,i)));
       xnm1_temp = u(:,i) + h * xn;
       % Corrector mediante el metodo el trapecio
       u(:,i+1) = u(:,i) + (h/2)*(feval(fun,t(i),u(:,i))+feval(fun, t(i+1),xnm1_temp));
    end
end