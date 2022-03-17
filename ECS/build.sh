#!/usr/bin/env bash

export AWS_REGION=us-east-1
export AWS_USERNAME=AWS
export AWS_ECR_URL=<AWS_ECR_URL!!!> # end with "/dtq-sharenote"

echo "Building Share Note..."

aws ecr get-login-password --region ${AWS_REGION} | docker login --username ${AWS_USERNAME} --password-stdin ${AWS_ECR_URL}

docker build -t dtq-sharenote .

docker tag dtq-sharenote:latest ${AWS_ECR_URL}:latest

docker push ${AWS_ECR_URL}:latest

echo "Build completed!"
