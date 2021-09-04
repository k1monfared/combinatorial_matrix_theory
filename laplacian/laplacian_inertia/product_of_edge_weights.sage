# product of the edge weights of a graph
def product_of_edge_weights(G,X):
    # G is a graph
    # X is a matrix of weights for the edges of G where weight of the edge {i,j} is X[i,j]
    # output is the product of the weights of the edges of G
    pi = 1
    for e in G.edges():
        pi = pi * X[e[0],e[1]]
    return(pi)