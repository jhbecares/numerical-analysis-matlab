% Predictor: Adams-bashforth de 4 pasos
% Corrector: Adams-Moulton de 3 pasos
% Inicializacion del metodo: Runge-Kutta de orden 4
function [t, u] = miab4am3 (t0, tfin, N, x0, f, par)
    % ENTRADA
    % t0 = tiempo inicial
    % tfin = tiempo final T
    % N = Numero de pasos
    % x0 = valor inicial, vector columna
    
    % f(t,x) funcion de la EDO
    % par = variable de entrada con parametros. 
    
    % SALIDA
    % t = vector fila de tiempos t(n)
    % u = tabla de valores de x(t(n))
    % numfun = contador del numero de evaluaciones de la funcion
    
    
    h = (tfin - t0)/N; % paso
    t = (t0:h:tfin); % mallado de puntos
    u = zeros(length(x0), N+1);
    u(:,1) = x0; % Incorporamos el dato inicial ; 
    fun(:,1) = feval(f,t(1),u(:,1));
    
    
    % Inicializaciones
    [tAux, uAux] = mirk4(t0, t0+3*h, 3, x0, f, par);
    
    % Suponemos que tenemos ya desde u(:,1) hasta u(:,4)
    for i=2:4
        u(:,i) = uAux(:,i);
        fun(:,i) = feval(f,t(i),u(:,i));
    end
    
    for i = 1:N-3
       % Metodo predictor  
       z = u(:,i+3)+ (h/24)*(55*fun(:,i+3) -59*fun(:,i+2) + 37*fun(:,i+1) -9*fun(:,i));
       
       % Metodo corrector 
       fun(:,i+4) = feval(f,t(i+4),z);
       u(:,i+4) = u(:,i+3)+(h/24)*(9*fun(:,i+4)+19*fun(:,i+3)-5*fun(:,i+2)+fun(:,i+1));
       fun(:,i+4) = feval(f,t(i+4),u(:,i+4));
    end
   
 end

 