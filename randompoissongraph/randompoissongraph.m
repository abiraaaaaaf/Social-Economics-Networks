function G = randompoissongraph(n,p)

m=p*n;
G = zeros(n);
for e = 1:m
r = randperm(n);
i = r(1); j = r(2);
G(i,j) = G(i,j) + 1;
G(j,i) = G(j,i) + 1;

end