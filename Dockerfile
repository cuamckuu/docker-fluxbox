FROM ubuntu:20.04

WORKDIR /browser

# VNC stuff
RUN apt update && apt install -y x11vnc xvfb fluxbox firefox && rm -rf /var/lib/apt/lists/*

COPY ./extensions/modheader-3.1.22-fx.xpi /browser/modheader-3.1.22-fx.xpi
COPY ./extensions/editthiscookie2-1.5.0-fx.xpi /browser/editthiscookie2-1.5.0-fx.xpi

COPY ./fluxbox/startup /root/.fluxbox/startup
RUN chmod +x /root/.fluxbox/startup

# Entrypoint:
COPY ./scripts/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
