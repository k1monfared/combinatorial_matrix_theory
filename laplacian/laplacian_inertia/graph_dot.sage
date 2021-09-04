def graph_dot(G,H,x=None,y=None):
	# G and H are graphs, x is a vertex of G and y is a vertex of H
	g = copy(G)
	h = copy(H)
	if x == None:
		x=g.vertices()[0]
	if y == None:
		y=h.vertices()[0]
	gh = graph_disjoint_union(g,h)
	gh.add_edge(['0'+str(x),'1'+str(y)])
	gh.contract_edge(['0'+str(x),'1'+str(y)])
	gh.relabel({'0'+str(x):str(x)+','+str(y)})
	return(gh)