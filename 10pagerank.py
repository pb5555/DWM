import numpy as np

def page_rank(adjacency_matrix, df, max_iterations=50):
  num_nodes = adjacency_matrix.shape[0]
  page_rank_scores = np.ones(num_nodes) / num_nodes
  for _ in range(max_iterations):
    new_page_rank_scores = adjacency_matrix.dot(page_rank_scores)
    new_page_rank_scores = df + (1 - df) * new_page_rank_scores
    if np.allclose(page_rank_scores, new_page_rank_scores):
        break
    page_rank_scores = new_page_rank_scores
    return page_rank_scores
  
link_matrix = np.array([
        [0, 1, 1, 0],
        [1, 0, 1, 0],
        [0, 0, 0, 1],
        [0, 0, 1, 0]
    ])
print(page_rank(link_matrix, 0.85))