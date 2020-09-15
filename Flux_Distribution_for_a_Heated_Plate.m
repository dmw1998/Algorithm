% Employ the results of Temperature_of_a_Heated_Plate_with_Fixed_BC_main.m 
% to determaine the distribution of heat flux for the heated plate from Fig. 29.4
% (P856). Assume that the plate is 40 * 40 cm and is made ouot of aluminum
% k'=0.49 cal/(s*cm* C)

%% Input the result matrix
Temperature_of_a_Heated_Plate_with_Fixed_BC_main

%% Calculate resultant flux
k = 0;
for j = 2:4
    for i = 2:4
        qx(i-1,j-1) = -0.49*(T(i+1,j)-T(i-1,j))/(2*10);           % delta x = 10
        qy(i-1,j-1) = -0.49*(T(i,j+1)-T(i,j-1))/(2*10);           % delta y = 10
        
        k = k+1;
        qn(i-1,j-1) = sqrt(qx(i-1,j-1)^2 + qy(i-1,j-1)^2);
        
        if qx(i-1,j-1) > 0
            theta(i-1,j-1) = atan(qy(i-1,j-1)/qx(i-1,j-1));
        elseif qx(i-1,j-1) < 0
            theta(i-1,j-1) =  atan(qy(i-1,j-1)/qx(i-1,j-1)) + pi;
        end                                                             % theta is in radians
        
    end
end

%% Graph the results (maybe wrong)
[x,y] = meshgrid(1:3,1:3);
g = quiver(x,y,theta,qn);
