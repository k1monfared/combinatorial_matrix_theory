def all_signed_graphs_with_tau(n,figsize=[1,1]):
    ngraphs = list(graphs.nauty_geng("{0} -c".format(n)))
    for G in ngraphs:
        #print('----')
        sG = all_graph_signings(G)
        for H in sG:
            #print('tau = %d' %(tau(H)[0]))
            plot_signed_graph(H,figsize=figsize).show()