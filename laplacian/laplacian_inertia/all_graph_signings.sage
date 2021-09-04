def all_graph_signings(G):
    m = G.size() # number of edges
    AS = all_signings(m) # list of 2^m possible signings of m edges
    signedG = [] 
    for signing in AS:
        H = copy(G)
        for i,e in enumerate(H.edges(sort=True)):
            H.set_edge_label(e[0], e[1], signing[i])  
        NH = signed_graph_negative(H)
        flag = 0
        for h in signedG:
            
            if h.is_isomorphic(H,edge_labels=True):
                flag = 1 # it is isomorphic to something in the list, ignore it
            if h.is_isomorphic(NH,edge_labels=True):
                flag = 1 # it is isomorphic to negative of something in the list, ignore it
				
        if flag == 0:
            signedG += [H]     
    return(signedG)