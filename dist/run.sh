DOCKER_BUILDKIT=1 docker build \
    --secret id=aws,src=${HOME}/.aws \
    --progress=plain \
    --network host \
    .
