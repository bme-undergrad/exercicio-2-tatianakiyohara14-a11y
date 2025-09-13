function [blendA, blendB] = exercicio2(NG)

% NG: numero do grupo
NG = 6

% nao alterar: inicio
es = 1;
imax = 20;
pkg load optim
% nao alterar: fim

% C = 10*blendA + (2*NG)*blendB  --> funaoo objetivo do custo
f = [10, NG*2]

% 0.30*blendA + 0.20*blendB = 15 --> requisito de polietileno
% 0.20*blendA + 0.25*blendB = 10 --> resquisito de PLA
% 0.25*blendA + 0.30*blendB = 12 --> requisito de polipropileno

% restrioees de desigualdade A.x <= b
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
x =x'

% mantenha essas duas linhas finais
blendA = x(1);
blendB = x(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
