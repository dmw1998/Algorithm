function N = find_N(t, tt)
N(1,1) = 1;

k = length(t);
i = 1/2*k;
for s = 1:1/2*k-1
    DP(s) = t(i+s)-tt;
    DM(s) = tt - t(i+1-s);
    N(1,s+1) = 0;
    for r = 1:s
        M = N(r,s)/(DP(r) + DM(s+1-r));
        N(r,s+1) = N(r,s+1) + DP(r) * M;
        N(r+1,s+1) = DM(s+1-r) * M;
    end
end
end