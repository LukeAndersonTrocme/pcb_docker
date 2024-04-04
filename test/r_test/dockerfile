# Use the official R base image
FROM r-base:latest

# Install required R packages
RUN R -e "install.packages(c('ggplot2', 'cowplot'), dependencies=TRUE)"

# Copy the R script into the Docker image
COPY scripts/plot_pca.r /usr/local/bin/plot_pca.r

# Make the script executable
RUN chmod +x /usr/local/bin/plot_pca.r

# Set the working directory to /data
WORKDIR /data

# Default command to run the R script
CMD ["Rscript", "/usr/local/bin/plot_pca.r"]
