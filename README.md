# containerit demo

This repo serves as a simple demo for writing a Dockerfile (and building the 
resulting Docker image) using the [**containerit**](https://o2r.info/containerit/index.html) 
R package. You should read more about **containerit** at the linked package 
homepage, but very briefly: it uses some neat heuristics and shortcuts to build 
a Docker image simply based on the contents of your existing directory or repo. 
Or, more precisely, the R files contained therein.

To run the demo, clone this repo to your local computer and then run the
`create-docker.R` script (e.g. using RStudio or `$ Rscript create-docker.R`). 
This will: 

1. Write a Dockerfile to disk (based on the contents of the `R/` sub-directory 
of the repo), and 
2. Build the corresponding Docker image (creatively titled `containerit-demo`)
associated with our new Dockerfile

The latter step requires that you actually have Docker installed and running on
your system. (If not, then you can at least still write the Dockerfile for others
to use/build.) Assuming that this is true, you can run the container by calling, 
e.g. `$ docker run --rm -ti containerit-demo`.

## Asides

The Docker image that we're building here isn't terribly exciting or complicated.
It mostly contains some additional spatial libraries (since the `R/` 
sub-directory requires the **sf** package) and builds upon the 
[rocker/rstudio](https://hub.docker.com/r/rocker/rstudio) stack. But the point 
is that all that work is done for us automatically and with minimal pain.

If you are unfamiliar with Docker then I strongly recommend checking out the
Rocker wiki (e.g. 
[this page](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image)), 
or [this ROpenSci tutorial](https://ropenscilabs.github.io/r-docker-tutorial/) 
first.
