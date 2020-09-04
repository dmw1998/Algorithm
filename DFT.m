function m = DFT(x)
N = length(x);
n = [0:N-1];
k = n';

transform_matrix = exp(-2*1i*pi*n.*k./N);

m = transform_matrix.*x;
end