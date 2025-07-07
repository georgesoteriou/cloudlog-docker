#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Configuration ---
# The username/organization for the Docker Hub repository.
DOCKER_USERNAME="georgesoteriou"
# The name of the image.
IMAGE_NAME="cloudlog"

# --- Input Validation ---
# Check if exactly one argument (the version) is provided.
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 2.6.19"
    exit 1
fi

# --- Variables ---
# Assign the first command-line argument to the VERSION variable.
VERSION=$1
# Construct the full image tags.
VERSION_TAG="${DOCKER_USERNAME}/${IMAGE_NAME}:${VERSION}"
LATEST_TAG="${DOCKER_USERNAME}/${IMAGE_NAME}:latest"

# --- Build Step ---
echo "--- Building Docker images for version ${VERSION} ---"
docker build --build-arg RELEASE_VERSION=${VERSION} -t ${VERSION_TAG} -t ${LATEST_TAG} .
echo "--- Build complete ---"
echo ""

# --- Push Step ---
echo "--- Pushing tags to Docker Hub ---"

# Push the version-specific tag (e.g., georgesoteriou/cloudlog:2.6.19)
echo "Pushing ${VERSION_TAG}"
docker push ${VERSION_TAG}

# Push the 'latest' tag
echo "Pushing ${LATEST_TAG}"
docker push ${LATEST_TAG}

echo ""
echo "--- Successfully built and pushed ${VERSION_TAG} and ${LATEST_TAG} ---"

