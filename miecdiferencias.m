x0=1;
x1=1/3;
N=100;
x=[x0,x1,zeros(1,N-1)];
for i=1:N 
   x(i+2) = feval(@funcecdif,x, i);
end
plot (x, 1:N+2)