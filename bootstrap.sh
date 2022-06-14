#!/bin/sh
aws ecr create-repository --repository-name eks-nvme-ssd-provisioner
docker buildx create --use --name crossbuild
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 344142597729.dkr.ecr.us-east-1.amazonaws.com
docker buildx build --platform linux/amd64,linux/arm64 -t 344142597729.dkr.ecr.us-east-1.amazonaws.com/eks-nvme-ssd-provisioner:latest --push -f Dockerfile.alpine .
