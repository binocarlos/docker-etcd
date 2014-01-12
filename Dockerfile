FROM ubuntu:12.04
RUN apt-get update
RUN apt-get install -y curl
RUN curl -L https://github.com/coreos/etcd/releases/download/v0.2.0/etcd-v0.2.0-Linux-x86_64.tar.gz -o /root/etcd-v0.2.0-Linux-x86_64.tar.gz
RUN cd /root && gzip -dc etcd-v0.2.0-Linux-x86_64.tar.gz | tar -xof -
RUN cp /root/etcd-v0.2.0-Linux-x86_64/etcd /usr/local/bin
RUN cp /root/etcd-v0.2.0-Linux-x86_64/etcdctl /usr/local/bin
RUN mkdir -p /data/db
EXPOSE 4001 7001
ENTRYPOINT ["/opt/etcd/etcd", "-c", "0.0.0.0:4001", "-s", "0.0.0.0:7001", "-data-dir", "/data/db"]