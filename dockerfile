# Use a lightweight base image
FROM python:3.9-slim

# Install a package
RUN pip install pandas

# Install bash shell
RUN apt-get update && apt-get install -y bash

# Install a package
RUN pip install matplotlib seaborn

# Set the working directory
WORKDIR /app

# Copy the PCA data file and Python script into the container
COPY /data/pca.csv /data/pca.csv
COPY /scripts/plot_pca.py /scripts/plot_pca.py

# Set the entrypoint to start an interactive bash shell
ENTRYPOINT ["/bin/bash"]