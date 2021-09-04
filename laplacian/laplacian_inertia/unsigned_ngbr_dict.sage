def unsigned_ngbr_dict(d):
    pos = {}
    neg = {}
    for v in d: # for each vertex
        Nv = d[v] # list of the neighbours of that vertex
        for w in Nv: # for each of the neighbours
            if Nv[w] == '+':
                if v in pos:
                    pos[v] += [w]
                else:
                    pos[v] = [w]
            elif Nv[w] == '-':
                if v in neg:
                    neg[v] += [w]
                else:
                    neg[v] = [w]
    return(pos,neg)