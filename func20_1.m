%%%%    Funci�n de la ecuaci�n diferencial de la pr�ctica 20 [a]
%%%%
%%%%    DATOS:
%%%%    x1, x2 - datos para generar y
%%%%        
%%%%
%%%%    RESULTADOS
%%%%    Variable y que almacena el valor de x^2 
%%%%    {soluci�n de la EDIF (si x(0)=1) x' = x^2:    1 / (1 - t))}
%%%%
%%%%    OBSERVACI�N: x'(t) = x(t)^2
%%%%        y     = x'
%%%%        x2    = x(t)
%%%%        x1    = t

function y = func20_1(t, x)
    y = x(2)*x(2);
end