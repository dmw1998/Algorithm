function v = cooley_tukey(x)

N = length(x);

if  N>2
    odd_x = cooley_tukey(x(1:2:N));
    even_x = cooley_tukey(x(2:2:N));
else
    odd_x = x(1);
    even_x = x(2);
end

n = 0:N-1 ;

half = fix(N/2);

W = exp(-2*1i*pi*n/N);

x = W(1:half);

v = [odd_x + even_x.*x, odd_x - even_x.*x];

end