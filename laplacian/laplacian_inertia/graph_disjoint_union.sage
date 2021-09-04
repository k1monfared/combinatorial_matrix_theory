def graph_disjoint_union(G,H):
	g = copy(G)
	h = copy(H)
	new_vertices = dict([])
	for v in g.vertices():
		g.relabel({v: '0'+str(v)})
	new_vertices = dict([])
	for v in h.vertices():
		h.relabel({v: '1'+str(v)})
	GD = g.to_dictionary(edge_labels=True)
	HD = h.to_dictionary(edge_labels=True)
	GD.update(HD)
	GH = Graph(GD)
	return(GH)