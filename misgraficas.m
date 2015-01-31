% if (length(x0) == 1)
%     %[t,u]=ode45(f, intervalo, x0); 
%     x=u;
%     plot(t,x(1,:), 'r');
%     title('Grafica de la solucion');
% elseif (length(x0) == 2 || length(x0) == 3)
%     %[t,u]=ode45(f, intervalo, x0);
%     x=u;
%     figure(1);
%     subplot(2,1,1);
%     plot(t, x(1,:), 'r');
%     title('Grafica de la primera componente');
%     subplot(2,1,2);
%     plot(t,x(2,:), 'g');
%     title('Grafica de la segunda componente');
%     if (length(x0)==3) 
%         subplot(2,1,3);
%         plot(t, x(3,:), 'b');
%         title('Grafica de la tercera componente');
%     end
%     figure(2);
%     x
%     if (length(x0)==2) 
%         plot(x(1,:),x(2,:), 'r');
%     elseif (length(x0)==3)
%         plot3(x(1,:),x(2,:),x(3,:), 'r');
%     end
%     title('Grafica de la solucion');
% end




if (length(x0) == 1)
    title('Grafica de la solucion');
    plot(t, u, 'r');
else
    if (length(x0) == 2)
        figure(1);
        title('Graficas de las componentes');
        subplot(2,1,1);
        plot(t, u(1,:), 'r');
        legend('Grafica de la primera componente frente a los nodos');
        subplot(2,1,2);
        plot(t, u(2,:), 'g');
        legend('Segunda componente frente a los nodos');
        
        pause(3);
        
        figure(2);
        plot(u(1,:), u(2,:), 'r');
        title('Grafica de la solucion');

    else
        if (length(x0) == 3)
            figure(1);
            subplot(3,1,1);
            plot(t, u(1,:), 'r');
            legend('Primera componente frente a los nodos');
            title('Graficas de las componentes');
           
            subplot(3,1,2);
            plot(t, u(2,:), 'g');
            legend('Segunda componente frente a los nodos');
            subplot(3,1,3);
            plot(t, u(3,:), 'b');
            legend('Tercera componente frente a los nodos');
            pause(3);
            figure(2);
            plot3(u(1,:), u(2,:), u(3,:), 'r');
            title('Grafica de la solucion');
        end
    end
end