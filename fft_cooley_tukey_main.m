x = rand(8);
y = cooley_tukey(x);
z = iterative_cooley_tukey(x);
v = DFT(x);
w = fft(x);