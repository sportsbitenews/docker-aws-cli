FROM alpine:3.6

ENV AWSCLI_VERSION=1.11.154

RUN adduser -S awscli && \
    mkdir /aws && \
    ln -s /aws /home/awscli/.aws && \
    chown awscli /aws /home/awscli/.aws

RUN apk --update add \
    python \
    py-pip \
    && pip install awscli==$AWSCLI_VERSION \
    && apk del py-pip \
    && rm -rf /var/cache/apk/*

USER awscli

ENTRYPOINT ["/usr/bin/aws"]

