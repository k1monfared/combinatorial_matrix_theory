def omit_trailing_zeros(L):
    # L is a list
    # output is the list L with all the trailing zeros omitted
    n = len(L)
    k = n # index of the last zero
    for i in range(n-1,-1,-1):
        if L[i] == 0:
            k = i
        else:
            break
    return(L[:k])