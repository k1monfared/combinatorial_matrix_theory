# nowherezero matrix construction
Given n real numbers with at least two of them being distinct, this constructs a real symmetric matrix with no zero entries such that its eigenvalues are the given numbers. The necessary and sufficient condition for such matrix to exist is that the given list of numbers has at least two distinct numbers in it. The code checks this and prints an error if it is not satisfied.

The algorithm is an implementation of the proof of Theorem Theorem 3.1 of "The combinatorial inverse eigenvalue problems: complete graphs and small graphs with strict inequality, W. Barrett, A. Lazenby, N. Malloy, C. Nelson, W. Sexton, Electronic Journal of Linear Algebra, 656-672 (26) 2013"
