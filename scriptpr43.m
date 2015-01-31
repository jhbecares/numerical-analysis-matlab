[t,u]=ode45(@funcvanderpol, [0:0.01:10], [0.1;0.2]);
x=u;
figure(1);
subplot(2,1,1);
plot(t, x(1,:));
subplot(2,1,2);
plot(t,x(2,:));
figure(2);
plot(x(1,:),x(2,:));