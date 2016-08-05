Latest Transmission release (currently 2.84) as a container.

Run it with:

    docker run \
    -p 0.0.0.0:9091:9091 \
    -p 0.0.0.0:51413:51413 \
    -p 0.0.0.0:51413:51413/udp \
    -v /var/lib/transmission:/var/lib/transmission:rw \
    fr3nd/transmission:latest \
    /usr/bin/transmission-daemon --foreground --config-dir /var/lib/transmission/.config/transmission
