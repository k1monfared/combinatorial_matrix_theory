def tau(G):
	""" Returns the flexibility of the graph
	Input: a signed graph G.
	
	Outputs: tau: the flexibility of G,
			c: number of connected components of G
			cp: number of connected compoents of the positive subgraph of G
			cn: number of connected compoents of the negative subgraph of G
	"""
	d = G.to_dictionary(edge_labels=True)
	[pos,neg] = unsigned_ngbr_dict(d)
	GP = Graph(pos)
	GP.allow_loops(False) # get rid of any incidental loops

	GN = Graph(neg)
	GN.allow_loops(False) # get rid of any incidental loops

	# add any possibly missing vertices
	GP.add_vertices(G.vertices())
	GN.add_vertices(G.vertices())

	cp = GP.connected_components_number()
	cn = GN.connected_components_number()
	c = G.connected_components_number()
	n = G.order()
	tau = n + c - cp - cn
	return(tau,c,cp,cn)