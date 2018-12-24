#
# Dockerfile for scrapyd
#
FROM alpine:latest

RUN set -xe \
    && apk update && apk add --no-cache python3 python3-dev \
    && wget -O - https://bootstrap.pypa.io/get-pip.py | python3 \
    && apk add --no-cache gcc libc-dev libffi-dev libxslt-dev openssl-dev \
    && pip install scrapy scrapyd scrapy-splash

COPY conf/scrapyd.conf /etc/scrapyd/scrapyd.conf

EXPOSE 6800/tcp

CMD ["scrapyd"]