def evaluate_cfs(cfs,w):
    #cfs: cofficints that are variables
    #w: weights that shall be replaced

    ncfs = [c(w) for c in cfs]
    return(ncfs)