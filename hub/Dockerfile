FROM dlhub/core

# PROXY SETTINGS
ARG all_proxy
ARG ftp_proxy
ARG http_proxy
ARG https_proxy
ARG no_proxy
ARG socks_proxy

ENV all_proxy $all_proxy
ENV ftp_proxy $ftp_proxy
ENV http_proxy $http_proxy
ENV https_proxy $https_proxy
ENV no_proxy $no_proxy
ENV socks_proxy $socks_proxy

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g configurable-http-proxy && \
    /opt/conda/envs/dl/bin/pip install jupyterhub notebook && \
    mkdir /etc/jupyterhub/

ADD jupyterhub_config.py /etc/jupyterhub/

EXPOSE 8000 9000-9500
WORKDIR /root/

ADD startup.sh /hub/

# These files should be placed in a volume mounted upon running the container,
# but unfortunately it prevents us from chaning read permissions later on.
# It's OK to add these files when building as long as this image is not being pushed
# to public Docker Hub.
ADD students.txt /hub/
ADD speakers.txt /hub/
RUN chmod -R og-rwx /hub/

CMD ["bash", "/hub/startup.sh"]
