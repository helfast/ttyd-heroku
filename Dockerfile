FROM tsl0922/musl-cross
RUN git clone --depth=1 https://github.com/tsl0922/ttyd.git /ttyd \
    && cd /ttyd && env BUILD_TARGET=x86_64 WITH_SSL=false ./scripts/cross-build.sh

#FROM ubuntu:18.04
FROM debian:stretch
COPY --from=0 /ttyd/build/ttyd /usr/bin/ttyd

ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /sbin/tini
RUN chmod +x /sbin/tini

RUN apt-update; apt-get install -y --no-install-recommends \
    python3 \
	python3-setuptools \
	python3-pip \
	zip \
	unzip \
	p7zip-full \
	wget \
	nano \
	detox \
	tmux \
        curl \
        htop \
        net-tools \
        && apt-get autoclean \
        && apt-get autoremove \
        && pip3 install gdown \
        && pip3 install speedtest-cli \
        && rm -rf /var/lib/apt/lists/*
    
    
ADD ./mc /app
RUN chmod +x /app/mc && mv /app/mc /usr/local/bin/

#EXPOSE 7681

ENTRYPOINT ["/sbin/tini", "--"]
#CMD ["ttyd", "bash"]
CMD ttyd --port $PORT --credential admin:admin bash
