% 24a
%C1 = 0; C2 = 0; t0 = 1; tfin = 2; a = 0; b = 2; N = 100; TOL = 10^-3;
% 24b
%C1 = 0; C2 = 0; t0 = 1; tfin = 2; a = 1; b = -1; N = 100; TOL = 10^-3;

% examen
t0 = 1; tfin = sqrt(20*pi); a = 0; b = 1/exp(1); TOL = 10^-3; N = 1000; C1 = 1; C2 = 0;

%[t, u, s, num] = midispnolin(t0, tfin, a, b, C1, C2, N, TOL); 
[t, u, valido, num, s, H] = midispnolin_web(t0, tfin, a, b, C1, C2, N, TOL);
% Pintamos los resultados
figure(1);
hold on;
plot(t,u(1,:), 'r');
title('Componentes');
plot(t,u(2,:), 'g');
pause(0.1);
figure(2);
plot(u(1,:),u(2,:), 'r');
title('Trayectoria');

% figure(3);
% plot(1:num+2, s);
% title('num frente a s');

figure(4);
for i = N+1:N+1:length(H)
    result1(mod(i,N)) = H(1,i);
    result2(mod(i,N)) = H(2,i);

end
%result
plot(s, result1);
title('s->H(s)');