def emm_of_gamma_of_tee(B):
	# B is the weighted adjacency matrix, or
	# B is the set of positive and negative edges
	var('t')

	if isinstance(B,sage.matrix.matrix_integer_dense.Matrix_integer_dense):
		n = B.ncols()
		B -= B.elementwise_product( identity_matrix(n) ) # delete diagonal entries
		Bt = B.elementwise_product( matrix([[b > 0 for b in bb] for bb in B]) ) + B.elementwise_product( t * matrix([[b < 0 for b in bb] for bb in B]) )
		Bt -= diagonal_matrix( sum(Bt) )
	elif isinstance(B,sage.graphs.graph.Graph):
		d = B.to_dictionary(edge_labels=True)
		[pos, neg] = unsigned_ngbr_dict(d)
		[G, GP, GN] = signed_graph([pos, neg])
		n = G.order()
		Bt = matrix(GP) - t * matrix(GN)
		Bt -= diagonal_matrix( sum(Bt) )
	else:
		pos = B[0]
		neg = B[1]
		[G, GP, GN] = signed_graph([pos, neg])
		n = G.order()
		Bt = matrix(GP) - t * matrix(GN)
		Bt -= diagonal_matrix( sum(Bt) )
			
	p = Bt.characteristic_polynomial()/n

	return(p[1].factor())