FROM nvidia/cuda:12.1.0-base-ubuntu22.04 AS nvidia-base

COPY qemu /usr/bin/

RUN apt-get update && apt-get install -y build-essential curl g++ autoconf

COPY build-ffmpeg /

ENV SKIPINSTALL=yes VERBOSE=yes

VOLUME /build
WORKDIR /build

CMD /build-ffmpeg --build

ENV PATH=/usr/local/bin:$PATH

ENTRYPOINT ["ffmpeg"]