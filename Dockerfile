FROM ubuntu:latest
RUN apt update
RUN apt install -y gcc
RUN apt install -y curl
RUN apt install -y zlib*
RUN apt install -y libpcre3 libpcre3-dev
RUN apt install make
WORKDIR /app
RUN curl -O https://nginx.org/download/nginx-1.25.3.tar.gz
RUN tar -xvf nginx-1.25.3.tar.gz
WORKDIR /app/nginx-1.25.3
RUN ./configure
RUN make
RUN make install
ENV PATH="$PATH:/usr/local/nginx/sbin"
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

