

# Ft_services
Ft_services is the most difficult devops project of the common core in 42.
It makes you deploy several containerized applications using Docker.
All these applications are clusterized, linked and managed using Kubernetes.
All these applications are launched with a script (setup.sh). The script is calling the necessary yaml and dockerfiles, to launch and start all applications.
The applications are:
* The Kubernetes web dashboard.
* A Load Balancer (MetalLB).
* A PhpMyAdmin.
* A WordPress website.
* Several servers (Nginx, FTPS).
* Several databases (MySQL, InfluxDB).
* A Grafana Dashboard.

More details are given on the project's subject.

## Getting started
This project is designed for macOS and Linux.
First of all, make sure that you have VirtualBox, Docker, Docker-Compose, and Minikube installed on your computer.

Then, in a terminal, launch the docker-setup.sh (s/o [@martichou](https://github.com/Martichou)) script to configurate Docker.

Afterwards, launch the setup.sh script and see the magic happening.
