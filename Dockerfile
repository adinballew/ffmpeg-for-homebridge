FROM nvidia/cuda:12.1.0-base-ubuntu22.04 AS nvidia-base

COPY qemu /usr/bin/

RUN apt-get update && apt-get install -y build-essential curl g++ autoconf ffmpeg

ENV SKIPINSTALL=yes VERBOSE=yes

COPY build-ffmpeg /

VOLUME /build
WORKDIR /build

ENV PATH=/usr/local/bin:$PATH

CMD /build-ffmpeg --build

ENTRYPOINT ["ffmpeg"]