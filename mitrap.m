 function [t, u, numfun] = mitrap (t0, tfin, N, x0, f, jac, itmax, par)
    % ENTRADA
    % t0 = tiempo inicial
    % tfin = tiempo final T
    % N = Numero de pasos
    % x0 = valor inicial, vector columna
    
    % f(t,x) funcion de la EDO
    % par = variable de entrada con parametros.
    % jac nombre del fichero con el jacobiano del segundo miembro de la edo
    % itmax = numero maximo de iteraciones en el metodo de newton
    
    % SALIDA
    % t = vector fila de tiempos t(n)
    % u = tabla de valores de x(t(n))
    % numfun = contador del numero de evaluaciones de la funcion
    
    
    h = (tfin - t0)/N; % paso
    t = (t0:h:tfin); % mallado de puntos
    u = zeros(length(x0), N+1);
    numfun = 0; 
    
    u(:,1) = x0; % Incorporamos el dato inicial
    TOL = h*h*h;
    %itmax = 10;
    
    for i = 1:N
       [u(:,i+1),evalfun] = newtonMethod(TOL, itmax, u(:,i), f, jac, h, t(i));
       numfun = numfun + evalfun;
    end
    
 
 end

 % Evalfun: numero de evaluaciones de la funcion
 function [zfin, evalfun] = newtonMethod(TOL, itmax, u, f, jac, h, tn)
    evalfun = 0;
    z(:,1) = u;
    
    gaux = u + h/2*feval(f, tn, u); % parte constante
    
    for i=2:itmax
       evalfun = evalfun + 2;
        
       gaux2 = h/2*feval(f, tn+h, z(:,i-1));
       GnZj = z(:,i-1) - gaux - gaux2;
       DGnZj = eye(length(u))-h/2*feval(jac, tn+h, z(:,i-1));
       W = DGnZj\GnZj;
       z(:,i) = z(:,i-1) - W;
       if (abs(z(:,i)-z(:,i-1)) <= TOL)
           zfin = z(:,i);
           return;
       end
    end
    
   zfin = z(:,itmax);
   return;
 end