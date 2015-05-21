
if length(x0) == 1
    figure(1);
    plot(t, u, 'r');
    title('Solucion aproximada');
    
elseif length(x0) == 2
    figure(1);
    subplot(2,1,1);
    plot(t,u(1,:), 'r');
    title('Componentes');
    legend('x(1)');
    subplot(2,1,2);
    plot(t,u(2,:), 'g');
    legend('x(2)');
    pause(0.1);
    figure(2);
    plot(u(1,:),u(2,:), 'r');
    title('Trayectoria');
    
elseif length(x0) == 3
    figure(1);
    subplot(2,1,1);
    plot(t,u(1,:), 'r');
    title('Componentes');
    legend('x(1)');
    subplot(2,1,2);
    plot(t,u(2,:), 'g');
    legend('x(2)');
    subplot(2,1,3);
    plot(t,u(3,:), 'b');
    legend('x(3)');
    pause(0.1);
    figure(2);
    plot3(u(1,:),u(2,:), u(3,:), 'r');
    title('Trayectoria');
end