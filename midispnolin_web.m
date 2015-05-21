%   midispnolin.m
%
%   Implementa el método de disparo para problemas no lineales.
%       u" = f(x, u, u')
%       u(T0) = a     <ó>     u'(T0) = a
%       u(TF) = b     <ó>     u'(TF) = b
%
%   Datos de entrada:
%       f -> @función de la EDIF: u" = f(x, u, u')
%       Intervalo -> Vector [T0, TF] que representa el intervalo donde
%                    resolveremos
%       N -> Número de intervalos con que resolveremos usando los métodos
%            de Runge-Kutta asociados.
%       CondicionEnT0 -> Valor para la condición de contorno en T0
%       CondicionEnTF -> Valor para la condición contorno en TF
%       TipoCondicionEnT0 -> Cero significa que la primera condición de
%                            contorno es de la forma u(T0) = a; en caso
%                            contrario, es de la forma u'(T0) = a.
%       TipoCondicionEnTF -> Cero significa que la primera condición de
%                            contorno es de la forma u(TF) = a; en caso
%                            contrario, es de la forma u'(TF) = a.
%       TOL -> Tolerancia para el error numerico del metodo.
%
%   Datos de salida:
%       t -> Vector de nodos
%       u -> Vector de valores de la solución estimada en cada nodo
%       valido -> 0 = El problema de contorno tiene solución única
%                 1 = El problema de contorno no tiene solución o no es única
%                 2 = El problema de contorno tiene múltuples soluciones y
%                 devolvemos una.
%
%   Utiliza:
%       mirk4.m -> Implementa el método de Runge-Kutta de orden 4.
%function [t, u, s, num] = midispnolin (t0, tfin, a, b, C1, C2, N, TOL)

%function [t, u, valido] = midispnolin(f, intervalo, N, CondicionT0, CondicionTF, TipoCondicionT0, TipoCondicionTF, TOL)
function [t, u, valido, NumeroVueltas, s, H] = midispnolin_web(CondicionT0, CondicionTF, a, b, TipoCondicionT0, TipoCondicionTF, N, TOL)
valido = 0;
Salir = 0;
NumeroVueltas = 0;
MaxVueltas = 10;

intervalo(1) = a;
intervalo(2) = b;
f = @funcdispnolin_2;
% Para simplificar un poco el codigo y corregir un pequeño error.
M = N + 1;

if (TipoCondicionT0 == 0) 
    if (TipoCondicionTF == 0)
        % ==================================
        % ==== CONDICIONES DE CONTORNO: u(T0)=a, u(TF)=b
        % ==================================
        s0 = (CondicionTF - CondicionT0) / (intervalo(2) - intervalo(1));
        s = s0;
        %
        CIni0 = [CondicionT0, s0];
        
        [trk, urk0] = mirk4(CondicionT0, CondicionTF, N, CIni0, f, []);
        H = [urk0];
        %
        s1 = s0 + (CondicionT0 - urk0(1,M)) / (intervalo(2) - intervalo(1));
        s = [s, s1];
        %
        while (Salir == 0)
            CIni1 = [CondicionT0, s1];
            
            [trk, urk1] = mirk4(CondicionT0, CondicionTF, N, CIni1, f, []);
            H = [H, urk1];
            %
            if (abs(urk1(1,M) - CondicionTF) <= TOL) 
                OK = 0;
            else
                OK = 1;
            end
            %
            if (OK == 0)
                Salir = 1;
            else
                aux = s1;
                s1 = s1 - ( (urk1(1,M) - CondicionTF) * (s1 - s0) / (urk1(1,M) - urk0(1,M)) );
                s0 = aux;
                s = [s, s1];
                %
                urk0 = urk1;
                %
                NumeroVueltas = NumeroVueltas + 1;
                if (NumeroVueltas > MaxVueltas)
                    Salir = 2;
                end         
            end
        end
        %
        t = trk;
        u = urk1;
        if (Salir == 1)
            valido = 0;
        else
            valido = 1;
            plot(t, u);
        end
    else
        % ==================================
        % ==== CONDICIONES DE CONTORNO: u(T0)=a, u'(TF)=b
        % ==================================
        s0 = (CondicionTF - CondicionT0) / (intervalo(2) - intervalo(1));
        s = s0;
        %
        CIni0 = [CondicionT0, s0];
        [trk, urk0] = mirk4(CondicionT0, CondicionTF, N, CIni0, f, []);
        H = urk0;
        %
        s1 = s0 + (CondicionT0 - urk0(1,M)) / (intervalo(2) - intervalo(1));
        s = [s, s1];
        %
        while (Salir == 0)
            CIni1 = [CondicionT0, s1];
            [trk, urk1] = mirk4(CondicionT0, CondicionTF, N, CIni1, f, []);
            H = [H, urk1];
            %
            if (abs(urk1(2,M) - CondicionTF) <= TOL)
                OK = 0;
            else
                OK = 1;
            end
            %
            if (OK == 0)
                Salir = 1;
            else
                aux = s1;
                s1 = s1 - ( (urk1(2,M) - CondicionTF) * (s1 - s0) / (urk1(2,M) - urk0(2,M)) );
                s0 = aux;
                s = [s, s1];
                %
                urk0 = urk1;
                %
                NumeroVueltas = NumeroVueltas + 1;
                if (NumeroVueltas > MaxVueltas)
                    Salir = 2;
                end         
            end
        end
        %
        t = trk;
        u = urk1;
        if (Salir == 1)
            valido = 0;
        else
            valido = 1;
        end
    end
else
    if (TipoCondicionTF == 0)
        % ==================================
        % ==== CONDICIONES DE CONTORNO: u'(T0)=a, u(TF)=b
        % ==================================
        s0 = (CondicionTF - CondicionT0) / (intervalo(2) - intervalo(1));
        s = s0;
        %
        CIni0 = [s0, CondicionT0];
        [trk, urk0] = mirk4(CondicionT0, CondicionTF, N, CIni0, f, []);
        H = urk0;

        %
        s1 = s0 + (CondicionT0 - urk0(1,M)) / (intervalo(2) - intervalo(1));
        s = [s, s1];
        %
        while (Salir == 0)
            CIni1 = [s1, CondicionT0];
            [trk, urk1] = mirk4(CondicionT0, CondicionTF, N, CIni1, f, []);
            H = [H, urk1];
            %
            if (abs(urk1(1,M) - CondicionTF) <= TOL)
                OK = 0;
            else
                OK = 1;
            end
            %
            if (OK == 0)
                Salir = 1;
            else
                aux = s1;
                s1 = s1 - ( (urk1(1,M) - CondicionTF) * (s1 - s0) / (urk1(1,M) - urk0(1,M)) );
                s0 = aux;
                s = [s, s1];
                %
                urk0 = urk1;
                %
                NumeroVueltas = NumeroVueltas + 1;
                if (NumeroVueltas > MaxVueltas)
                    Salir = 2;
                end         
            end
        end
        %
        t = trk;
        u = urk1;
        if (Salir == 1)
            valido = 0;
        else
            valido = 1;
        end
    else
        % ==================================
        % ==== CONDICIONES DE CONTORNO: u'(T0)=a, u'(TF)=b
        % ==================================
        s0 = (CondicionTF - CondicionT0) / (intervalo(2) - intervalo(1));
        s = s0;
        %
        CIni0 = [s0, CondicionT0];
        [trk, urk0] = mirk4(CondicionT0, CondicionTF, N, CIni0, f, []);
        %
        s1 = s0 + (CondicionT0 - urk0(1,M)) / (intervalo(2) - intervalo(1));
        s = [s, s1];
        %
        while (Salir == 0)
            CIni1 = [s1, CondicionT0];
            [trk, urk1] = mirk4(CondicionT0, CondicionTF, N, CIni1, f, []);
            %
            if (abs(urk1(2,M) - CondicionTF) <= TOL)
                OK = 0;
            else
                OK = 1;
            end
            %
            if (OK == 0)
                Salir = 1;
            else
                aux = s1;
                s1 = s1 - ( (urk1(2,M) - CondicionTF) * (s1 - s0) / (urk1(2,M) - urk0(2,M)) );
                s0 = aux;
                s = [s, s1];
                %
                urk0 = urk1;
                %
                NumeroVueltas = NumeroVueltas + 1;
                if (NumeroVueltas > MaxVueltas)
                    Salir = 2;
                end         
            end
        end
        %
        t = trk;
        u = urk1;
        if (Salir == 1)
            valido = 0;
        else
            valido = 1;
        end
    end    
end

