FROM debian:stretch
MAINTAINER Ronmi Ren <ronmi@shoutloud.top>

RUN apt-get update \
 && apt-get install -y build-essential dpkg-dev \
 && apt-get clean -y \
 && rm -fr /var/lib/apt/lists/*
WORKDIR /data
ADD build /usr/local/bin/
ENTRYPOINT ["build"]
