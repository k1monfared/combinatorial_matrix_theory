#
def matrix_weights_to_vector(W):
    n = W.ncols()
    w = [0 for i in range(n*(n+1)/2)]
    count = 0
    for i in range(n):
            for j in range(i+1):
                w[count] = W[i,j]
                count += 1
    return(w)