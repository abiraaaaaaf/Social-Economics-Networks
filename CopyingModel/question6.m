%%

close all
clc
p = 0.5;
v = 5000;
edge = 12000;
nodes = zeros(v,1);

for k =1 : v
    nodes(k) = k;
end

csvwrite('csvnodes.dat',nodes);
    edges = zeros(edge+2,2);
   % edges(0,1)='Source';
   % edges(0,2)='Target';
    cnt = 0;
    graph = zeros(v , v); 
    
    
    %%
    while cnt < edge
        op = binornd(1 , p);
        if op ==0
            s = 0;
            %%
            while s == 0
                w1 = randi(v);
                w2 = randi(v);
                if  graph(w1, w2) == 0
                    s = 1 ; 
                    graph(w1, w2) = 1;
                    cnt = cnt + 1 ; 
                    edges(cnt , 1) = w1 ; 
                    edges(cnt , 2) = w2 ; 
                end
            end
        else
            c = 0 ;
            %
            avval = randi(v);
            cntedge = randi(v);
             
            while c < cntedge && cnt < edge
                dovom = randi(v);
                if sum(graph(dovom,:))== 0 
                    break
                end
                for i =1 :v
                    if graph(avval,i) == 0 && graph(dovom,i) == 1
                        graph(avval,i)= graph(dovom,i);
                        c = c +1;
                        cnt = cnt +1;
                        edges(cnt,1) = avval;
                        edges(cnt,2) = i;
                    end
                    if c== cntedge && cnt == edge       
                        break
                    end
                end
            end
        end
    end
    
    
header = {'Source','Target'};
csvwriteh('csvedges.dat',edges,header);