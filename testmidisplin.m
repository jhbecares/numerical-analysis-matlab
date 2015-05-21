% % 22i
% t0 = 0; tfin = 1; a = 0; b = 2; N = 1000; C1 = 0; C2 = 0;
% % 22ii
% t0 = 0; tfin = 5; a = -2; b = 1; N = 1000; C1 = 0; C2 = 1;
% % 22iii
 t0 = 0; tfin = 10; a = -2; b = -1; N = 1000; C1 = 1; C2 = 0;
% % 22iv
% t0 = 0; tfin = 10; a = -2; b = -1; N = 1000; C1 = 1; C2 = 1;

[t, u] = midisplin (t0, tfin, a, b, N, C1, C2);
figure(1);
hold on;
%subplot(2,1,1);
plot(t,u(1,:), 'r');
title('Componentes');
%legend('u(1)');
%subplot(2,1,2);
plot(t,u(2,:), 'g');
%legend('u(2)');
pause(0.1);
figure(2);
plot(u(1,:),u(2,:), 'r');
title('Trayectoria');