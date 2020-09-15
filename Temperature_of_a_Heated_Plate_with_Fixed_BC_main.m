% Use Liebmann's method (Gauss-Seidel) to solve for  the temperature
% of the heated plate in Fig. 29.4 (P856). Employ overrelaxation with a 
% value of 1.5 for the weighting factor and iterate to epsilon_s = 1 %

%% Set the boundary values
T = zeros(5,5);

for i = 1:5
    T(1,i) = 75;
    T(i,1) = 0;
    T(i,5) = 100;
    T(5,i) = 50;
end

%% Calculate the temperature until error less than 1 %
i=0;
error = 1;
while error > 0.01
    i = i+1;
    [T, error] = Cal_T(T);
end

% Print the iteration number, error and interior point values.
i
error
T(2:4,2:4)'















