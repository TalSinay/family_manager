#!/bin/bash

SSH_USER="taldevops"
SSH_HOST="20.86.132.101"
IMAGE_NAME="tesla7300/family_manager"

ssh $SSH_USER@$SSH_HOST << EOF
  docker pull $IMAGE_NAME
  docker stop myapp || true
  docker rm myapp || true
  docker run -d --name myapp -p 80:80 $IMAGE_NAME
EOF
