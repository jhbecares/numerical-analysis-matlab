%   mimilsimp.m
%
%   Funcion que implementa el metodo de prediccion correccion que usa como
%   Predictor -> Metodo de Milne de 4 pasos
%   Corrector -> Metodo de Simpson de 2 pasos
%
%   Inicializa el metodo utilizando el metodo de Runge-Kutta de orden 4

function [t, u] = mimilsimp(t0, tfin, N, x0, f, param)

    h = (tfin-t0) / N;
    t = (t0:h:tfin);
    u = x0;    


    % Inicializamos los 4 primeros valores por RK-4
    intervalo2 = [t(1), t(5)];
    [~, u2] = mirk4(intervalo2(1), intervalo2(2), 3, x0, f, param);
    for i = 1 : 4
        u(:, i) = u2(:, i);
    end

    % Milne [4 pasos]
    % u[I] = u[I-4] + 4h/3 * (2 f[I-1] - f[I-2] + 2 f[I-3])
    % Simpson [2 pasos]
    % u[I] = u[I-2] + h/3 * (f[I] + 4 f[I-1] + f[I-2])

    k3 = feval(f, t(2), u(:, 2));
    k2 = feval(f, t(3), u(:, 3));

    for i = 5 : N + 1
        k1 = feval(f, t(i - 1), u(:, i - 1));

        % Predictor [Milne]
        uAux = u(:, i-4) + (4*h/3)*(2*k1 - k2 + 2*k3);

        % Corrector [Simpson]
        fAux = feval(f, t(i), uAux);
        u(:, i) = u(:, i-2) + (h/3)*(fAux + 4*k1 + k2);

        k3 = k2;
        k2 = k1;
    end
end