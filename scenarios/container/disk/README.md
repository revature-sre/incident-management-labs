# Node Scenario: Disk Saturation

This scenario will introduce a spike in disk saturation approximately every hour for the image that it builds.

## Deploy Instructions

This Dockerfile needs to be built with access to the planetarium spring application as well as the `saturate-disk.sh` script.

First place the `saturate-disk.sh` script and the provided `Dockerfile` inside the `spring` directory of the `planetarium-spring-api` repository, located [here](https://github.com/revature-sre/planetarium-spring-api).
Then build the image, tagging it appropriately in order to upload to a Docker registry, such as `ikenoxamos/planetarium:scenario2`.

Finally, push the image up to the Docker registry.

Instruct the associates to leverage the new image for their application Deployment.