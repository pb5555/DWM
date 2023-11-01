import numpy as np
def hits_algorithm(adjacency_matrix, max_iterations=100, tol=1e-6):
    num_pages = adjacency_matrix.shape[0]
    hub_scores = np.ones(num_pages)
    authority_scores = np.ones(num_pages)
    for _ in range(max_iterations):
        new_authority_scores = np.dot(adjacency_matrix.T, hub_scores)
        new_hub_scores = np.dot(adjacency_matrix, new_authority_scores)
        new_authority_scores /= np.linalg.norm(new_authority_scores, 2)
        new_hub_scores /= np.linalg.norm(new_hub_scores, 2)
        if np.all(np.abs(new_authority_scores - authority_scores) < tol) and \
           np.all(np.abs(new_hub_scores - hub_scores) < tol):
            break
        authority_scores, hub_scores = new_authority_scores, new_hub_scores
    return hub_scores, authority_scores

adjacency_matrix = np.array([
    [0, 1, 1, 0],
    [1, 0, 1, 1],
    [0, 1, 0, 1],
    [0, 0, 1, 0]
])

hub_scores, authority_scores = hits_algorithm(adjacency_matrix)

print("Hub Scores:", hub_scores)
print("Authority Scores:", authority_scores)
