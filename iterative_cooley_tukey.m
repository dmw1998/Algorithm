function arr = iterative_cooley_tukey(x)
N = length(x);
x = bitreverse(x);

arr = complex(x);
fin = fix(log2(N));

for j = 1: fin+1
    stride = 2^j;
    W = exp(-2*1i*pi / stride);
    for k = 0 : stride : N
        v = 1;
        for l = 1 : stride/2
            arr(l+k+stride/2) = arr(l+k) - v*arr(l+k+stride/2);
            arr(l+k) = arr(l+k) - arr(l+k+stride/2) - arr(l+j);
            v = v*W;
        end
    end
end

end