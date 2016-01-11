# gwilym/terraform-docker

This repo contains a Dockerfile to compile (from source) and run Terraform.

For more information on Terraform, see http://www.terraform.io/

`docker build` will build this container without running anything. The resulting image should be appropriate for tagging and pushing to a Docker image repository.

Note that Terraform is a large, complex application. Compilation time can be in the tens of minutes depending on your environment.
