FROM alpine:3.12

RUN apk --update add git-crypt

WORKDIR /opt/project

COPY entrypoint.sh .

ENTRYPOINT ["/opt/project/entrypoint.sh"]
