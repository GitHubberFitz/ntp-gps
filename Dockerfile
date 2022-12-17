FROM alpine:latest
ARG BUILD_DATE

### About this container
LABEL build_info="fitzdockerhub/ntp-gps build-date:- ${BUILD_DATE}"
LABEL maintainer="Fitz <https://twitter.com/fitz3253>"
LABEL documentation="https://github.com/GitHubberFitz/ntp-gps"

### Installs
RUN apk add --no-cache gpsd gpsd-clients ntpsec

### Ports
EXPOSE 123/udp

### NTP startup script
COPY newpoint.sh /root/newpoint.sh
COPY gpsd /etc/default/gpsd
COPY ntp.conf /etc/ntp.conf

### Monitor NTP process
HEALTHCHECK CMD ntpq -p || exit 1

### Start script
ENTRYPOINT ["sh", "-c", "/root/newpoint.sh"]
#ENTRYPOINT [ "/bin/sh", "/opt/startup.sh" ]