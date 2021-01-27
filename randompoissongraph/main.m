
clc;
close all;
figure
iter=50;
d1 = zeros(1,iter);
d2 = zeros(1,iter);
p=0.5;
for n=1:iter
    n
    G = randompoissongraph(n,p);
    d1(n)=pathlength(G);
    c = p*(n-1);
    d2(n) =(log(n)/log(c)); 
end
plot(d1 , '--')
hold on;
plot(d2 )
hold on;
iter=50;
d1 = zeros(1,iter);
n=1000;
figure

for p=1:iter
    p
    G=randompoissongraph(n,p/10);
    d1(p)=pathlength(G);
    c = p*(n-1);
    d2(p) =(log(n)/log(c)); 
end
plot(d1 , '--')
hold on;
plot(d2)
hold on;
