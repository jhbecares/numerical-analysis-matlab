 function [t, u, numfun] = mieulertr (t0, tfin, N, x0, f, par)
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
    
    u(:,1) = x0; % Incorporamos el dato inicial ; 
    
    for i = 1:N
       % Metodo predictor
       fn = feval(f, t(i), u(:,i));
       z = u(:,i)+h*fn;
       
       % Metodo corrector 
       fn1 = feval(f, t(i), z);
       u(:,i+1) = u(:,i)+(h/2)*(fn+fn1);
    end
    
 
 end

 