#Download base image Alpine
FROM alpine:latest

# Install build dependencies
RUN apk add --no-cache libmicrohttpd-dev jansson-dev openssl-dev \
  libcurl glib-dev opus-dev libogg-dev pkgconf gengetopt libconfig-dev \
  libtool autoconf automake cmake libnice-dev libmicrohttpd-dev \
  lksctp-tools-dev libwebsockets-dev git gcc make g++ zlib-dev 

# Manually install libsrtp to ensure openssl build
RUN wget https://github.com/cisco/libsrtp/archive/v2.3.0.tar.gz \
  && tar xfv v2.3.0.tar.gz \
  && cd libsrtp-2.3.0 \
  && ./configure --prefix=/usr --enable-openssl \
  && make shared_library && make install

# Install usrsctp, needed for data channels
RUN git clone https://github.com/sctplab/usrsctp \
  && cd usrsctp && ./bootstrap && ./configure --prefix=/usr \
  && make && make install

# Install Janus WebRTC server
RUN git clone https://github.com/meetecho/janus-gateway.git \
  && cd janus-gateway \
  && sh autogen.sh \
  && ./configure --prefix=/opt/janus \
		--disable-docs \
		--disable-rabbitmq \
		--disable-mqtt \
  && make \
  && make install \
  && make configs

# Declare the ports we use
EXPOSE 8088 8188

ENTRYPOINT ["/opt/janus/bin/janus"]
