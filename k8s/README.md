This folder contains the k8s manifest used to guide the clusters' orchestration:

deployment.yaml
This defines the Kubernetes deployment. Labels the deployment as "project" with 2 pods running. The container will be called "project-container" and will expose port 8000 matching the Dockerfile.

service.yaml
This defines stable networking and load balancing to the pods. This provisions an AWS load balancer. An opens up port 80 to access the pods port at 8000.

ingress.yaml
Not necessary for the scope of the project thus far but a good to have when routing external HTTP(s) traffic. The ALB will be publicly accessible targeting the pods IP address. The ALB will be listening on port 80. It will route all HTTP traffic to project-service:80
