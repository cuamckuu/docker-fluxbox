FROM alpine:3.13.5

WORKDIR /browser

# VNC stuff
RUN apk update && apk add --no-cache x11vnc xvfb fluxbox xterm firefox ttf-ubuntu-font-family && rm -rf /tmp/* /var/cache/apk/*

COPY ./extensions/modheader-3.1.22-fx.xpi /browser/modheader-3.1.22-fx.xpi
COPY ./extensions/editthiscookie2-1.5.0-fx.xpi /browser/editthiscookie2-1.5.0-fx.xpi

COPY ./fluxbox/startup /root/.fluxbox/startup
RUN chmod +x /root/.fluxbox/startup

# Entrypoint:
COPY ./scripts/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
