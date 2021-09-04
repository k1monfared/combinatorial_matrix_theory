def signed_graph(B):
    if isinstance(B,sage.matrix.matrix_integer_dense.Matrix_integer_dense) or isinstance(B,sage.matrix.matrix_generic_dense.Matrix_generic_dense):
        n = B.ncols()
        B -= B.elementwise_product( identity_matrix(n) ) # delete diagonal entries
        BP = B.elementwise_product( matrix([[b > 0 for b in bb] for bb in B]) )
        BN = B.elementwise_product( matrix([[b < 0 for b in bb] for bb in B]) )
        GP = Graph(BP)
        GN = Graph(BN)
        pos = GP.to_dictionary()
        neg = GN.to_dictionary()
        G = Graph(signed_ngbr_dict(pos,neg))
        
    else:
        pos = B[0]
        neg = B[1]
        GP = Graph(pos)
        GP.allow_loops(False) # get rid of any incidental loops

        GN = Graph(neg)
        GN.allow_loops(False) # get rid of any incidental loops

        G = Graph(signed_ngbr_dict(pos,neg))
        G.allow_loops(False) # get rid of any incidental loops

        # add any possibly missing vertices
        GP.add_vertices(G.vertices())
        GN.add_vertices(G.vertices())
    
    return(G,GP,GN)