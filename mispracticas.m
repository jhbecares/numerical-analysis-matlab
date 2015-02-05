%  f=@funcvanderpol;
%  jacobianofunvanderpol=@jacobianovanderpol;
%  x0=[0.1;0.2];
%  intervalo=[0,10];
% N=1000;

% f=@funcpendulolin;
% x0=[0.1;0.2];
% intervalo=[0,10];
% N=1000;

 %f=@funcvanderpol; x0=[0.1;0.2]; intervalo=[1,10]; N=1000; itmax=10;jac=@jacobianovanderpol;par=[];

% f=@funccorazon;
% x0=[0.1;0.2];
% intervalo=[0,10];
% N=1000;

% f=@func20_2;
% x0=[0.1;0.2];
% intervalo=[0,2];
% par = [];
% N=1000;


% f=@funcduffing;
% x0=[0.1;0.2];
% intervalo=[0,5];
% N=1000;
% par = [];
% 
% f=@funccompet;
% x0=[0.1;0.2];
% intervalo=[0,5];
% N=1000;
% par = [];

% f=@funcdeppresa;
% x0=[0.1, 0.2];
% intervalo=[0,100];
% N=1000;
% par = [];

f=@funclorenz;
x0=[0, 5, 75];
intervalo=[0,5];
N=1000;
par = [];