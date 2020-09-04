function transform_matrix = DFT(x)

N = length(x);

n = [0:N-1]

k = n';

transform_matrix = exp(-2*i*pi*n.*k./N)

end