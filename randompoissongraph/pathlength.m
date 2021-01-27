function diameter1 = pathlength(G)

G1 = G;
n = length(G);
power = 1;
Plength = sign(G + eye(n,n)); 

while any(any(G1==0)) && power <= (n-1)
    power = power + 1;
    G1 = G1*G;
    Plength = Plength + ( (Plength == 0) & (G1 > 0) )*power;
end

Plength = Plength - diag(diag(Plength));   
diameter1=max(max(Plength));

end