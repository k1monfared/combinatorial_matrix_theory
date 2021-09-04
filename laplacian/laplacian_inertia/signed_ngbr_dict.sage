def signed_ngbr_dict(pos,neg):
    # pos: list of vertices and their positive neighbours
    # neg: list of vertices and their negative neighbours
    # output: list of vertices and their neighbours with lables '+' and '-'
    V = list(set(pos.keys()+neg.keys()))
    all_ngbrs = {}
    for v in V:
        all_ngbrs[v] = {}
        if v in pos:
            for ngbr in pos[v]:
                all_ngbrs[v].update({ngbr: '+'})
        if v in neg:
            for ngbr in neg[v]:
                all_ngbrs[v].update({ngbr: '-'})
    return(all_ngbrs)