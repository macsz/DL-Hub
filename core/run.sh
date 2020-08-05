
NOTEBOOKS_DIR=$(pwd)/notebooks
mkdir -p $NOTEBOOKS_DIR

DID=$(docker run \
    -p 8888:8888 \
    -v $NOTEBOOKS_DIR:/notebooks/ \
    -tdi dlhub/core \
    /opt/conda/envs/dl/bin/jupyter notebook \
        --ip=0.0.0.0 \
        --no-browser \
        --allow-root
    )

sleep 5

docker logs $DID
