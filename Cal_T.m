% Use Liebmann's method (Gauss-Seidel) to solve for  the temperature
% of the heated plate in Fig. 29.4 (P856). Employ overrelaxation with a 
% value of 1.5 for the weighting factor.

% Input a initial temperature matrix
% Output a new temperature matirx and maximum error between two matrices

function [T_new, max_error] = Cal_T(T_old)
T_new = T_old;

for j = 2:4
    for i = 2:4
        T_new(i,j) = (T_new(i+1,j) + T_new(i-1,j) + T_new(i,j+1) + T_new(i,j-1))/4;
        T_new(i,j) = 1.5*T_new(i,j) + (1-1.5)*T_old(i,j);
        error(i,j) = (T_new(i,j) - T_old(i,j))/T_new(i,j);
    end
end

max_error = max(max(abs(error)));
end
