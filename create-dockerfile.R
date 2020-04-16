## Step 0: Load / install required libraries
if (!(require(containerit))) {
  if (!(require(remotes))) install.packages("remotes") 
  remotes::install_github("o2r-project/containerit")
}
if (!(require(here))) install.packages("here") 


## Step 1:Get the Dockerfile environment
my_env <- containerit::dockerfile(from = here::here("R/01-parent.R"),
                                  image = "rocker/rstudio") # Optional: Specify which Rocker image to build on


## Step 2 (optional): Print the proposed Dockerfile in the console
cat(as.character(format(my_env)), sep = "\n")


## Step 3: Write the Dockerfile to disk
write(my_env, file = here::here("Dockerfile"))


## Step 4: Build a Docker image from the newly-written Dockerfile
## Note: This step requires that the Docker Daemon is installed/running on your 
## system. On Linux, this also means that you may need to run this script as root,
## since Docker must be be run with root privileges. Or, you can avoid this by 
## adding your user to the docker group: $ sudo usermod -a -G docker <username>
containerit::docker_build(x = here::here(), 
                          tag = "containerit-demo"
                          )
