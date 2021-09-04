def sign_with_tau(G,figsize=[1,1]):
    sG = all_graph_signings(G)
    for t in range(G.order()):
        print('The following signings of the graph have tau = %d' %t)
        for H in sG:
            if tau(H)[0] == t:
                plot_signed_graph(H,figsize=figsize).show()