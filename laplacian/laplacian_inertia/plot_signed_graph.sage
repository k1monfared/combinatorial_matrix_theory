# plot signed graph
def plot_signed_graph(G,
                      edge_colors = {'+': "black", '-': "red"},
                      vertex_color = "white",
                      edge_thickness = 2,
                      layout = 'circular',
                      edge_labels = False,
                      figsize = [3,3]):
    # input:
    #     G: a signed graph where edges are labeled + or -
    #     edge_colors: color_by_label will use this to map labels to colors
    #
    # ouput: plot with black positive edges and red negative edges

    H = G.plot(edge_colors = G._color_by_label(edge_colors),
           vertex_color = vertex_color,
           edge_thickness = edge_thickness,
           layout = layout,
           edge_labels = edge_labels,
           figsize = figsize,
		   title = r"$\tau = %d$" %(tau(G)[0]))
    return(H)