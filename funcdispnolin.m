%   funcdispnolin.m
%
%   Almacena la funcion f de la EDIF:
%       u" = f(t, u, u')
%
%   Datos de entrada:
%       t -> valor de t
%       x -> vector (u(t), u'(t))
%
%   Datos de salida:
%       y -> valor correspondiente a [u', u"]
%
%       y' = z;
%       z' = 2 * (y ^ 3);

function y = funcdispnolin(t, x)

% Practica 24, (i)
y = [x(2); -x(2)^2 + x(1) + t];

% Practica 24, (ii)
% y = [x(2); 2 * (x(1) ^ 3)];
 