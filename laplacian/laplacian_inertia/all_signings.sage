def all_signings(m):
    T = [['.' for i in range(m)]]
    for i in range(m):
        for j in range(len(T)):
            t = copy(T[j])
            t[i] = '+'
            T += [t]
            t = copy(T[j])
            t[i] = '-'
            T += [t]
    return(T[-2^m:])