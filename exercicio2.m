function [blendA, blendB] = exercicio2(NG)

% NG: numero do grupo
NG = 6

% nao alterar: inicio
es = 1;
imax = 20;
pkg load optim
% nao alterar: fim

% C = 10*blendA + (2*NG)*blendB
f = [10, NG*2]'
x0 = [1,1]

% restricoes de desigualdade A.x <= b
A = [-0.30, -0.20;
    -0.20, -0.25;
    -0.25, -0.30];
b = [-15;
    -10;
    -12];

% restricoes de igualdade Aeq.x = beq
Aeq = [];
beq = [];

%limites inferiores e superiores
lb = [0;0];
ub = [20;50];

x = linprog(f, A, b, Aeq, beq, lb, ub)
x = x'

% mantenha essas duas linhas finais
blendA = x(1);
blendB = x(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
