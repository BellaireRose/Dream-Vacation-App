#!/usr/bin/env bash
set -euo pipefail

# cd into the directory where docker-compose.prod.yml lives
DEPLOY_DIR="/home/ubuntu/dream-app"
cd "$DEPLOY_DIR" || exit 1

# pull latest images
docker pull ${DOCKERHUB_REPO_PREFIX}/dream-vacation-backend:latest
docker pull ${DOCKERHUB_REPO_PREFIX}/dream-vacation-frontend:latest

# recreate stack
docker-compose -f docker-compose.prod.yml down || true
docker-compose -f docker-compose.prod.yml up -d
docker image prune -f
echo "Deployment finished successfully"
