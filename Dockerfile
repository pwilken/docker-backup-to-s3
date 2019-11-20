FROM debian:jessie
MAINTAINER Ilya Stepanov <dev@ilyastepanov.com> and Pierre Jack Wilken <kontakt@pierrewilken.de>

RUN apt-get update && \
    apt-get install -y python python-pip cron && \
    rm -rf /var/lib/apt/lists/*

RUN pip install s3cmd

ADD s3cfg /root/.s3cfg

ADD sync.sh /sync.sh
RUN chmod +x /sync.sh

ENTRYPOINT ["/sync.sh"]
