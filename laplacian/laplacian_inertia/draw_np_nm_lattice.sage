def draw_np_nm_lattice(G):
    n = G.order()
    [t, c, cp, cn] = tau(G)
    ymin = cn - 1
    ymax = n - cp
    xmin = cp - 1
    xmax = n - cn
    p = []
    IL = []
    for i in range(1,t+1):
        for j in range(i-1,t-i):
            p += [(n-cp-j, cn-1+j)]
            IL += [(n-cp-j, cn-1+j,i)]
    h = point(p, size = 100)
    return(h,IL)