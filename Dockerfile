FROM alpine:3.20
WORKDIR /app

RUN apk add --no-cache tini rsync docker-cli

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]
CMD ["crond", "-f", "-l", "2"]
