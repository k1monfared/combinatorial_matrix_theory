#
def find_nowhere_zero_solutions(sols):
    nwzsols = []
    for ss in sols:
        flag = 1
        for v in ss:
            try:
                x = v.rhs().numerator() == 0
                if x:
                    flag = 0
                    break
            except RuntimeError:
                pass
        if flag:
            nwzsols += [ss]
    return(nwzsols)