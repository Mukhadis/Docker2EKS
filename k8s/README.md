# Kubernetes Manifests

This directory contains the Kubernetes manifests for deploying the backend application to EKS.

## Files

- `namespace.yaml`: Creates the `backend-app` namespace
- `deployment.yaml`: Defines the deployment and service for the backend application

## Deployment

The GitHub Actions workflow automatically:
1. Builds the Docker image
2. Pushes it to ECR
3. Updates the deployment manifest with the new image URI
4. Applies the manifests to the EKS cluster

## Manual Deployment

If you need to deploy manually:

```bash
# Configure kubectl for your EKS cluster
aws eks update-kubeconfig --region us-east-1 --name your-cluster-name

# Apply the manifests
kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml

# Check the deployment
kubectl get pods -n backend-app
kubectl get services -n backend-app
```

## Port Configuration

- Container Port: 8000 (matches Dockerfile)
- Service Port: 80 (external access)
- Health checks are configured on port 8000
