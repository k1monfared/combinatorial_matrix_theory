#
def build_variables_laplacian(A,B=0,x='a'):
    #inputs:
    # 1. A is the positive adjacency and B is the negative adjacency but its entries are positive
    # the foloowing input methods are not implemented yet
    ### 2. A is the adjacency and B is not given
    ### 3. A is the dict of vertices and their positive neighbors and B is the dict of vertices and their negative neighbours
    ### 4. A is the dict of vertices and their neightbours with the labels + and - for the sign of the corresponding edges
    ### 5. A is the signed graph with labels + and - for edges}
    if isinstance(A,dict):
        if B:
            GP = Graph(A)
            GP.allow_loops(False) # get rid of any incidental loops

            GN = Graph(B)
            GN.allow_loops(False) # get rid of any incidental loops

            G = Graph(signed_ngbr_dict(A,B))
            G.allow_loops(False) # get rid of any incidental loops

            # add any possibly missing vertices
            GP.add_vertices(G.vertices())
            GN.add_vertices(G.vertices())

            AP = matrix(GP) # adjacency matrix of the positive part
            AN = matrix(GN) # adjacency matrix of the negative part

            mp = sum(sum(AP))/2 #number of positive edges
            mn = sum(sum(AN))/2 #number of negative edges
        #else:
        #    G = Graph(A)

    #elif isinstance(A,sage.matrix.matrix_integer_dense.Matrix_integer_dense):
    #    if B:
    #        G = Graph(A-B, format='weighted_adjacency_matrix')
    #    else:
    #        G = Graph(A, format='weighted_adjacency_matrix')
    #    for e in G.edges():
    #        G.set_edge_label(e[0],e[1],'+' if e[2] > 0 else '-')

    #elif isinstance(A,sage.graphs.graph.Graph):
    #    G = A

    #else:
    #    raise ValueError('I cannot understand the input.')

    n = G.order() # number of vertices
    [X,vars_list,R] = build_all_variables_laplacian(n,x=x) # symmtric matrix with generic variable names on each entry
    #vars = []
    #for i in range(len(vars_list)):
    #    vars += vars_list[i]
    #var('t')
    #SA = AP-t*AN # signed adjacency matrix
    SA = AP-AN # signed adjacency matrix

    # create the matrix with only variables where the edges are
    for i in range(n):
        SA[i,i] = 0
        X[i,i] = 0
        for j in range(n):
            if i != j:
                X[i,j] = X[i,j] * SA[i,j]
                X[i,i] = X[i,i] - X[i,j]

    cfs = [0 for i in range(mn + 1)] # list of coefficients of the M(\Gamma(t))
    # find the pi(T) for all spanning trees T of G and add up the ones with k negative edges put in cfs[k]
    ST = labeled_spanning_trees(G)
    for T in ST:
        k = number_of_negative_edges(T)
        cfs[k] += product_of_edge_weights(T,X)

    cfs = omit_trailing_zeros(cfs)

    vars = []
    for i in range(X.ncols()):
        for j in range(i):
            if SA[i,j] != 0:
                vars += [vars_list[i][j]]

    return(X,G,SA,cfs,[vars,R])