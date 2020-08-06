docker run \
    --hostname=DLHub \
    -p 80:8000 \
    -p 9000-9500:9000-9500 \
    -ti dlhub/hub $@

# /opt/conda/envs/dl/bin/jupyterhub
