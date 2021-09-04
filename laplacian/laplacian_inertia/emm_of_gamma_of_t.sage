def emm_of_gamma_of_t(cfs):
    #returns the polynmials with given coefficients
    var('t')
    p = 0
    for i in range(len(cfs)):
        p += cfs[i] * t^i
    return(p)