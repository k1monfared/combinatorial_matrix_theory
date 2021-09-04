#
def solve_with_nonzero_solutions(pos,neg):
    [X,G,SA,cfs,vars]= build_variables_laplacian(pos, neg, x='a')
    dcfs = polynomial_derivatives(cfs,k=1)
    eq1 = emm_of_gamma_of_t(cfs)
    eq2 = emm_of_gamma_of_t(dcfs)
    eq3 = nonzero_condition(vars[0])
    sols = solve([eq1,eq2],vars[0] + [t])
    nwz = find_nowhere_zero_solutions(sols) # this gives some Maxima errors some times which is a known bug
    #nwz = sols
    return(nwz)