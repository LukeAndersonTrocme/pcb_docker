# R Script Docker Tutorial

## Introduction

This tutorial demonstrates how to containerize an R script using Docker. It focuses on a PCA plotting example.

## Prerequisites

- Docker
- Git

## Installation

Clone the repository:

```
bash
git clone https://github.com/LukeAndersonTrocme/pcb_docker.git
cd pcb_docker
```

Be sure to navigate to the root directory of the project where the Dockerfile is located. Then build the Docker image:
```
docker build -t pca_plotter .
```
This command tells Docker to build an image named pca_plotter based on the instructions in the Dockerfile located in the current directory (.).

## Running the Docker Container
Run the Docker container by mounting the data directory to the /data directory inside the container.
```
docker run --rm -v $(pwd)/data:/data pca_plotter
```
This command does the following:

`docker run` tells Docker to run a container.
`--rm` instructs Docker to remove the container once it stops running.
`-v $(pwd)/data:/data` mounts the data directory from your project to the /data directory in the container. 
`$(pwd)` is replaced by your current directory path, making sure your `pca.csv` file is accessible to the script inside the container.
`pca_plotter` is the name of the Docker image to run.

## Runtime
This docker image took 6 minutes to build on my laptop:
```
luke$ docker build -t pca_plotter .
[+] Building 392.7s (10/10) FINISHED                                                                                    
 => [internal] load build definition from dockerfile                                                               0.0s
 => => transferring dockerfile: 528B                                                                               0.0s
 => [internal] load .dockerignore                                                                                  0.0s
 => => transferring context: 2B                                                                                    0.0s
 => [internal] load metadata for docker.io/library/r-base:latest                                                   0.7s
 => CACHED [1/5] FROM docker.io/library/r-base:latest@sha256:89665d00ab6ec19ee1b6c64d94f8de1f376b0db04fb7f52c7757  0.0s
 => [internal] load build context                                                                                  0.0s
 => => transferring context: 1.46kB                                                                                0.0s
 => [2/5] RUN R -e "install.packages(c('ggplot2', 'cowplot'), dependencies=TRUE)"                                391.4s
 => [3/5] COPY scripts/plot_pca.r /usr/local/bin/plot_pca.r                                                        0.0s 
 => [4/5] RUN chmod +x /usr/local/bin/plot_pca.r                                                                   0.1s 
 => [5/5] WORKDIR /data                                                                                            0.0s 
 => exporting to image                                                                                             0.5s 
 => => exporting layers                                                                                            0.5s 
 => => writing image sha256:e360f59af47df43bf8983283f9a4c0fdfda38d457ebe875744617923dc601035                       0.0s 
 => => naming to docker.io/library/pca_plotter                                                                     0.0s
```

## Notes

The data are downloaded from [gnomad](https://gnomad.broadinstitute.org/downloads#v3-hgdp-1kg) (Sample metadata TSV)
