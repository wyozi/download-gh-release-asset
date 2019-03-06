FROM alpine:latest
LABEL author="wyozi <wyozi@github.com>"

LABEL "com.github.actions.name"="Download GitHub Release Asset"
LABEL "com.github.actions.description"="Downloads an asset uploaded to GitHub release"
LABEL "com.github.actions.icon"="download"
LABEL "com.github.actions.color"="purple"

RUN	apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  wget \
  jq

COPY download-asset /usr/bin/download-asset
RUN chmod +x /usr/bin/download-asset

ENTRYPOINT ["/usr/bin/download-asset"]