#
def labeled_spanning_trees(self):
    # this is a modification of spanning_trees() with edges being labeled
    """
    Returns a list of all spanning trees.

    If the graph is disconnected, returns the empty list.

    Uses the Read-Tarjan backtracking algorithm [RT75]_.

    EXAMPLES::

        sage: G = Graph([(1,2),(1,2),(1,3),(1,3),(2,3),(1,4)], multiedges=True)
        sage: len(G.spanning_trees())
        8
        sage: G.spanning_trees_count()
        8
        sage: G = Graph([(1,2),(2,3),(3,1),(3,4),(4,5),(4,5),(4,6)], multiedges=True)
        sage: len(G.spanning_trees())
        6
        sage: G.spanning_trees_count()
        6

    .. SEEALSO::

        - :meth:`~sage.graphs.generic_graph.GenericGraph.spanning_trees_count`
          -- counts the number of spanning trees.

        - :meth:`~sage.graphs.graph.Graph.random_spanning_tree`
          -- returns a random spanning tree.

    TESTS:

    Works with looped graphs::

        sage: g = Graph({i:[i,(i+1)%6] for i in range(6)})
        sage: g.spanning_trees()
        [Graph on 6 vertices,
         Graph on 6 vertices,
         Graph on 6 vertices,
         Graph on 6 vertices,
         Graph on 6 vertices,
         Graph on 6 vertices]

    REFERENCES:

    .. [RT75] Read, R. C. and Tarjan, R. E.
      Bounds on Backtrack Algorithms for Listing Cycles, Paths, and Spanning Trees
      Networks, Volume 5 (1975), numer 3, pages 237-252.
    """

    def _recursive_spanning_trees(G, forest):
        """
        Returns all the spanning trees of G containing forest
        """
        if not G.is_connected():
            return []

        if G.size() == forest.size():
            return [forest.copy()]
        else:
            # Pick an edge e from G-forest
            for e in G.edge_iterator(labels=True):
                if not forest.has_edge(e):
                    break

            # 1) Recursive call with e removed from G
            G.delete_edge(e)
            trees = _recursive_spanning_trees(G, forest)
            G.add_edge(e)

            # 2) Recursive call with e include in forest
            #
            # e=xy links the CC (connected component) of forest containing x
            # with the CC containing y. Any other edge which does that
            # cannot be added to forest anymore, and B is the list of them
            c1 = forest.connected_component_containing_vertex(e[0])
            c2 = forest.connected_component_containing_vertex(e[1])
            G.delete_edge(e)
            B = G.edge_boundary(c1, c2, sort=False)
            G.add_edge(e)

            # Actual call
            forest.add_edge(e)
            G.delete_edges(B)
            trees.extend(_recursive_spanning_trees(G, forest))
            G.add_edges(B)
            forest.delete_edge(e)

            return trees

    if self.is_connected() and self.order():
        forest = Graph()
        forest.add_vertices(self.vertex_iterator())
        forest.add_edges(self.bridges())
        return _recursive_spanning_trees(Graph(self, immutable=False, loops=False), forest)
    else:
        return []