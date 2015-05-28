%%%%    Funcion de la ecuacion diferencial de la practica 20b)
%%%%
%%%%    RESULTADOS
%%%%    Variable y que almacena el valor de exp(x2)/10 + cos(x2-x1)
%%%%
%%%%    OBSERVACION:
%%%%        y     = x'
%%%%        x2    = x(t)
%%%%        x1    = t

function y = func20_2(t, x)
y = (exp(x(1))) / 10 + cos(x(1) - x(1));
end