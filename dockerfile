# Use a lightweight base image
FROM python:3.9-slim

# Install required packages
RUN pip install pandas matplotlib seaborn

# Set the working directory
WORKDIR /app

# Copy the Python script into the container
COPY scripts/plot_pca2.py /app/plot_pca2.py

# Set the entrypoint and command
ENTRYPOINT ["python3", "/app/plot_pca2.py"]
CMD ["input_data.csv", "output_plot.png"]