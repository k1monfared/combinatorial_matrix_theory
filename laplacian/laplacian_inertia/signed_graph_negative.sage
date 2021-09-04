def signed_graph_negative(G):
    d = G.to_dictionary(edge_labels=True)
    [pos,neg] = unsigned_ngbr_dict(d)
    NG = Graph(signed_ngbr_dict(neg,pos))
    return(NG)