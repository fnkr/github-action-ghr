FROM alpine:latest

LABEL "com.github.actions.name"="GitHub Releases"
LABEL "com.github.actions.description"="Upload build artifacts to GitHub releases"
LABEL "com.github.actions.icon"="log-in"
LABEL "com.github.actions.color"="blue"

ENV GHR_FORK tcnksm/ghr
ENV GHR_VERSION 0.12.0

RUN apk add --no-cache bash curl xz

RUN sh -c "curl --silent -L https://github.com/${GHR_FORK}/releases/download/v${GHR_VERSION}/ghr_v${GHR_VERSION}_linux_amd64.tar.gz > ghr_v${GHR_VERSION}_linux_amd64.tar.gz" && \
    sh -c "tar xvzf ghr_v${GHR_VERSION}_linux_amd64.tar.gz" && \
    sh -c "mv ghr_v${GHR_VERSION}_linux_amd64/ghr /usr/local/bin/" && \
    sh -c "rm -rf ghr_v${GHR_VERSION}_linux_amd64 ghr_v${GHR_VERSION}_linux_amd64.tar.gz"

COPY ghr-wrapper ghr-compress /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/ghr-wrapper"]
