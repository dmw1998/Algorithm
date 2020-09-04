function arr = butterfly(x)
N = length(x);
half = fix(N/2);
n = [0:N-1];

W = exp(-2*1i*pi*n/N);

for j = 1:half
    arr(j) = x(j) + x(half+j) * W(j);
    arr(half+j) = x(j) - x(half+j) * W(j);
end

end