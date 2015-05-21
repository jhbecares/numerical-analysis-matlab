x0 = 1;
x1 = 1/3;
N = 40;

% x tiene N+1 puntos
% x = [x0, x1, zeros(1,N-1)];

x(1) = x0;
x(2) = x1;

for i=1:N-2
    x(i+2) = feval(@funcecdif, [x(i),x(i+1)]);
end

plot(x, 1:N);


