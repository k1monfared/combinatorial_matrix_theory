#
def polynomial_derivatives(cfs,k=1):
    # cfs: list of coefficients of a poynomials where cfs[i] is the coefficient of degree i term
    # k: number of derivatives
    # output: dcfs: coefficients of the derivative of the polynomial
    cfs = omit_trailing_zeros(cfs)
    if k == 0:
        return(cfs)
    elif k > 0:
        dcfs = [factorial(i)/factorial(i-k)*cfs[i] for i in range(k,len(cfs))]
        if len(dcfs) < 1:
            return([0])
        else:
            return(dcfs[:])
    else:
        raise ValueError('k shall be a nonnegative integer.')