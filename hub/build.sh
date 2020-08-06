time docker build --build-arg all_proxy=${all_proxy} \
                  --build-arg ftp_proxy=${ftp_proxy} \
                  --build-arg http_proxy=${http_proxy} \
                  --build-arg https_proxy=${https_proxy} \
                  --build-arg no_proxy=${no_proxy} \
                  --build-arg socks_proxy=${socks_proxy} \
                  -t dlhub/hub .