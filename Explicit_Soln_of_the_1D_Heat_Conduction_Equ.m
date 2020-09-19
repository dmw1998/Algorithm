% Use the explicit method to solve for the temperature distribution of a
% long, thin rod with a length of 10 cm and the following values: k' = 0.49
% cal/(s*cm*C), delta x = 2 cm, and delta t = 0.1 s. At t = 0, the
% temperature of the rod is zero and the boundary condidions are fixed for
% all times at T(0) = 100 C and T(10) = 50 C. Note that the rod is aluminum
% with C = 0.835 cm^2/s and lemda = 0.835(0.1)/2^2 = 0.020875.

lambda = 0.020875;
T(1,2:5) = 0;
T(1,1) = 100;
T(1,6) = 50;

%% At t = 0.1, nodes at 2 cm, 4 cm, 6 cm and 8 cm

T(2,1) = 100;
T(2,6) = 50;

for i = 2:5
    T(2,i) = T(1,i) + lambda*(T(1,i+1) - 2*T(1,i) + T(1,i-1));
end 

%% At t = 0.2 

T(3,1) = 100;
T(3,6) = 50;

for i = 2:5
    T(3,i) = T(2,i) + lambda*(T(2,i+1) - 2*T(2,i) + T(2,i-1));
end 

%% Repeat until t = 12

for j = 4:120
    T(j,1) = 100;
    T(j,6) = 50;
    for i = 2:5
    T(j,i) = T(j-1,i) + lambda*(T(j-1,i+1) - 2*T(j-1,i) + T(j-1,i-1));
    end
end 

%% Print some results

xx = 0:2:10;
plot(xx,T(30,:))
hold on
plot(xx,T(60,:))
plot(xx,T(90,:))
plot(xx,T(120,:))
hold off