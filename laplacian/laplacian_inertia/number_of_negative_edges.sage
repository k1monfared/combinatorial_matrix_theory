def number_of_negative_edges(T):
    count = 0
    for e in T.edges():
        if e[2] == '-':
            count += 1
    return(count)