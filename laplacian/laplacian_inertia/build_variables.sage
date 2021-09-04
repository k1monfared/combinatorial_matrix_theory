# Build variables
def build_variables(n,x='x'):
    names = [ [[] for i in range(j+1)] for j in range(n) ]
    for i in range(n):
        for j in range(i+1):
            names[i][j] = (SR(x+'_' + str(j) + '_' + str(i)))
    return(names)