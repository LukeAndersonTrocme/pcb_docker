#!/usr/bin/env python3

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from matplotlib.colors import ListedColormap

pca_file = "/data/pca.csv"  # Assuming '/data' is mounted in Docker

def plot_pca(data, pc_x, pc_y, ax):
    sns.scatterplot(x=pc_x, y=pc_y, hue="genetic_region", data=data, 
                    palette="plasma", ax=ax, legend=False)
    ax.set_xlabel(pc_x)
    ax.set_ylabel(pc_y)

def main():
    pca_data = pd.read_csv(pca_file)

    fig, axs = plt.subplots(2, 2, figsize=(9, 8))

    # Generate individual PCA plots
    plot_pca(pca_data, "PC1", "PC2", axs[0, 0])
    plot_pca(pca_data, "PC3", "PC4", axs[0, 1])
    plot_pca(pca_data, "PC5", "PC6", axs[1, 0])
    plot_pca(pca_data, "PC7", "PC8", axs[1, 1])

    plt.tight_layout()

    plt.savefig("/data/pca_plots.png")

if __name__ == "__main__":
    main()
