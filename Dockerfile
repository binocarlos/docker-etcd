FROM flynn/etcd
RUN mkdir -p /data/db
EXPOSE 4001 7001
ENTRYPOINT ["/bin/etcd", "-addr", "0.0.0.0:4001", "-peer-addr", "0.0.0.0:7001", "-data-dir", "/data/db", "-snapshotCount", "100", "-snapshot"]