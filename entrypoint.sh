#!/bin/sh
docker daemon > /var/log/docker.log 2>&1 &

nohup sslocal  -s "$SERVER" \
	 -p "$SERVER_PORT" \
         -l "$LOCAL_PORT" \
         -b "$LOCAL_ADDR" \
         -k "$PASSWORD" \
         -m "$METHOD" \
         -t "$TIMEOUT" &
                                                                        
nohup /usr/sbin/privoxy --no-daemon --user privoxy /etc/privoxy/config &

                                                                        
while [[ true ]]; do
    sleep 1
done
	                                                                        

