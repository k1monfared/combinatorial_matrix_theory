def bicomplete_wedge_minus(m,n):
    G = signed_graph(matrix(graphs.CompleteGraph(m)))[0]
    H = signed_graph(matrix(graphs.CompleteGraph(n)))[0]
    gwh = graph_wedge_minus(G,H)
    return(gwh)