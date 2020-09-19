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

A(1,1) = 1;
A(6,6) = 1;

%% t = 0.1

b = T(1,:)';

for i = 2:5
    A(i,i-1) = -lambda;
    A(i,i) = 1 + 2*lambda;
    A(i,i+1) = -lambda;
end

x = A\b;

T(2,:) = x;

%% t = 0.2

b = T(2,:)';

for i = 2:5
    A(i,i-1) = -lambda;
    A(i,i) = 1 + 2*lambda;
    A(i,i+1) = -lambda;
end

x = A\b;
T(3,:) = x;

%% Repeat until t = 12

for j = 4:120
    b = T(j-1,:)';
    
    for i = 2:5
        A(i,i-1) = -lambda;
        A(i,i) = 1 + 2*lambda;
        A(i,i+1) = -lambda;
    end
    
    x = A\b;
    T(j,:) = x;
end

%% Print some results

xx = 0:2:10;
plot(xx,T(30,:))
hold on
plot(xx,T(60,:))
plot(xx,T(90,:))
plot(xx,T(120,:))
hold off