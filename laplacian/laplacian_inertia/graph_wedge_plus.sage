def graph_wedge_plus(G,H):
    gh = graph_disjoint_union(G,H)
    for x in G.vertices():
        for y in H.vertices():
            gh.add_edge(['0'+str(x),'1'+str(y), '-'])
    return(gh)