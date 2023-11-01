import networkx as nx
import matplotlib.pyplot as plt

G = nx.DiGraph()

G.add_edges_from([
    ('A','D'),('B','C'),('B','E'),('C','A'),('D','C'),('E','D'),('E','B'),
    ('E','F'),('E','C'),('F','C'),('F','H'),('G','A'),('G','C'),('H','A')
])

plt.figure(figsize=(12,12))
nx.draw(G, with_labels=True)

hubs, authorities = nx.hits(G, max_iter=50, normalized=True)

print("Hub scores:", hubs)
print("Authortiy scores: ",authorities)