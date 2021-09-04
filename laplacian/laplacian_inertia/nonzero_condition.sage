#
def nonzero_condition(vars):
    nonzero_condition = 1
    for v in vars:
        nonzero_condition *= v
    nonzero_condition -= 1
    return(nonzero_condition)