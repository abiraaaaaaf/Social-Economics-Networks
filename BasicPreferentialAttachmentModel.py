from numpy import *
import random
import matplotlib.pyplot as plt
m = 1
m0 = 5
n = 500
cntnodes = n + m0
while m < 6:
    # m=1 , m=5
    ####
    graph = []
    for i in range(m0):
        graph.append(set())     #keeping neighbors of a node in a set
    while len(graph) < cntnodes:
        list = []
        for k, v in enumerate(graph):
            list = list + [k]*len(v)    #repeating edge as much as degree
        graph.append(set())
        siz = len(graph)
        sizl = len(list)
        e = []
        if len(list) < m:    #m ta be soorate uniform
            e = random.sample(range(siz), m - sizl)
        else:
            e = random.sample(list, m)
        for v in e:
            graph[-1].add(v)
            graph[v].add(len(graph) - 1)
    deg_maximum = max(map(len, graph))
    deg = [0]*(deg_maximum + 1)
    for v in graph:
        deg[len(v)] += 1    #faravanie har daraje
    deg_total = sum(deg)
    deg = map(lambda x: float(x) / deg_total, deg)    #deg/deg_total
    fig = plt.figure(m)
    # degree distribution from formula
    plt.loglog(range(deg_maximum + 1), map(lambda x: float(x) /deg_maximum, deg), 'g-')
    # degree distribution calculated!
    plt.loglog(range(1, deg_maximum+ 1), map(lambda x: 2.0 * float(m) ** 2.0 * float(x) ** -3.0, range(1, deg_maximum + 1)),'g+')
    fig.show()
    m = m + 4
