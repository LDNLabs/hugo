FROM ubuntu:19.10
LABEL name="Hugo"

# Install wget
RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y npm

# Install hugo
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.69.2/hugo_extended_0.69.2_Linux-64bit.tar.gz
RUN tar -xzf hugo_extended_0.69.2_Linux-64bit.tar.gz
RUN mv hugo /opt/hugo

# Add hugo to path
ENV PATH="/opt/:${PATH}"
RUN echo $PATH

# Log versions
RUN set -x \
    && hugo version
