

n = 5242 ; 
ed = 14496 ; 
%random graph 5242 nodes and 14496 edges

%ring part 2
h = WattsStrogatz(n,2,0);
plot(h,'NodeColor','k','Layout','circle');
title('Watts-Strogatz Graph with $N = 5242$ nodes, $K = 4$, and $\beta = 0$','Interpreter','latex');

fileID = fopen('CAGrQc.txt','r');
formatSpec = '%d %d';
sizeA = [2 Inf];
A = fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
Adj = zeros (5242 , 5242);
for i = 1 : 28980
    Adj[A[i 1]  A[i 2]]=1;
end
G = graph(A);
plot(G)
