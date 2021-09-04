# Build matrix of variables
def build_all_variables_laplacian(n,x='a'):
    my_variables = build_variables(n,x)
    R = PolynomialRing(CC,[my_variables[i][j] for i in range(n) for j in range(i+1)])
    #var('t')
    #R = PolynomialRing(CC,[my_variables[i][j] for i in range(n) for j in range(i+1)]+[t])
    #R.gens()
    #R.inject_variables()
    X = [ [[] for i in range(n)] for j in range(n) ]
    for j in range(n):
        for i in range(j+1):
            X[i][j] = R.gens()[j*(j+1)/2 + i]
            X[j][i] = R.gens()[j*(j+1)/2 + i]
    for j in range(n):
        X[j][j] = - sum(X[j]) + X[j][j]
    return(matrix(X),my_variables,R)