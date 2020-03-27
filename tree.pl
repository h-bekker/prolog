tree(2, tree(3, empty, empty), tree(5, tree(7, empty, empty), empty)).
depth_tree(empty, 0).
depth_tree(tree(_, L, R), N):- depth_tree(L, N1), depth_tree(R, N2), N is max(N1, N2) + 1.

num_list(empty, 0).
num_list(tree(_, empty, empty), 1):- !.
num_list(tree(_, L, R), N):- num_list(L, N1), num_list(R, N2), N is N1+N2.

