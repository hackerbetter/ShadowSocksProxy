FROM alpine

RUN echo 'http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories \
    && apk add -U curl libsodium python \
        && apk add privoxy \
            && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
                && pip install shadowsocks \
                    && apk del curl \
                        && rm -rf /var/cache/apk/*
                        
                        COPY ./config /etc/privoxy/config
                        COPY ./entrypoint.sh /
                        RUN chmod +x /entrypoint.sh
                        
                        ENV SERVER hk-1.v2speed.net
                        ENV SERVER_PORT 32394
                        ENV LOCAL_PORT 1080
                        ENV LOCAL_ADDR 0.0.0.0
                        ENV PASSWORD default
                        ENV METHOD rc4-md5
                        ENV TIMEOUT 300
                        
                        
                        EXPOSE $LOCAL_PORT
                        
                        CMD ["/entrypoint.sh"]

