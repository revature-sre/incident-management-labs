# Incident Management Labs

This repository contains instructions to deliver Incident Management Labs for the Revature SRE curriculum.

These labs are designed to simulate various issues that manifest themselves in commonly looked at prometheus.
In particular, the issues are designed to be intermittent. They will not always be present.

Associates will be expected to recognize that something is wrong with the environment, and work towards identifying the cause.
As the issues are only simulated, associates will be expected to locate a given error message that will take the place of identifying the root cause.

These error messages provide context when building the Incident Management Report.
They can also be matched against the expected message for the Trainer or QC analyst to determine whether the associates have successfully diagnosed the problem.

These labs are intended to be deployed onto a Kubernetes Cluster on AWS, via Elastic Kubernetes Service (EKS).

## Scenarios

There are currently 3 categories of error scenarios: Network Latency, CPU Consumption, and Disk Saturation.
These issues can either be present inside the application container, or directly on the server.

### Setup

For scenarios that run directly on the node, the trainer will need to upload all required scripts to the node.
From there, run any setup scripts in advance. Then create a cronjob configuration to run the scenario's script.

Logs will be written to the `/var/log/` directory.