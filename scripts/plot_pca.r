#!/usr/bin/env Rscript

# Load required libraries
library(ggplot2)
library(cowplot)

# Define the path to the PCA file
pca_file <- "/data/pca.csv" # Assuming '/data' is mounted in Docker

# Function to create PCA plots
plot_pca <- function(data, pc_x, pc_y) {
  ggplot(data, aes_string(x = pc_x, 
                          y = pc_y, 
                          color = "genetic_region")) +
    geom_point() +
    theme_minimal() +
    scale_color_viridis_d(option = "turbo") +
    theme(legend.position = "none")
}

main <- function() {
  # Load PCA data
  pca_data <- read.csv(pca_file)

  # Generate individual PCA plots
  pca_plot1 <- plot_pca(pca_data, "PC1", "PC2")
  pca_plot2 <- plot_pca(pca_data, "PC3", "PC4")
  pca_plot3 <- plot_pca(pca_data, "PC5", "PC6")
  pca_plot4 <- plot_pca(pca_data, "PC7", "PC8")

  # Combine plots into a single grid without legends
  combined_plots <- plot_grid(
    pca_plot1, pca_plot2, pca_plot3, pca_plot4,
    align = 'vh',
    ncol = 2
  )

  # Extract and add a shared legend
  legend <- get_legend(
    plot_pca(pca_data, "PC1", "PC2") + theme(legend.position = "right")
  )
  final_plot <- plot_grid(
    combined_plots,
    legend,
    rel_widths = c(1, .2)
  )

  # Save the final plot to a file
  ggsave("/data/pca_plots.png", final_plot, width = 12, height = 8)
}

# Execute the main function
main()
