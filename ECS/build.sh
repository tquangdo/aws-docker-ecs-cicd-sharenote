#!/usr/bin/env bash

export AWS_REGION=ap-northeast-1
export AWS_USERNAME=AWS
export AWS_ECR_URL=<AWS_ACCID!!!>.dkr.ecr.ap-northeast-1.amazonaws.com/dtq-sharenote

echo "Building Share Note..."

aws ecr get-login-password --region ${AWS_REGION} | docker login --username ${AWS_USERNAME} --password-stdin ${AWS_ECR_URL}

docker build -t dtq-sharenote .

docker tag dtq-sharenote:latest ${AWS_ECR_URL}:latest

docker push ${AWS_ECR_URL}:latest

echo "Build completed!"