ARG STACK_VERSION

FROM docker.elastic.co/elasticsearch/elasticsearch:${STACK_VERSION}
ADD --chown=elasticsearch:root --chmod=750 ./certs/ config/certs/
ARG NODE_NAME
COPY <<-EOT config/certs/instances.yml

  instances:
  - name: ${NODE_NAME}
    dns:
      - ${NODE_NAME}
      - localhost
    ip:
      - 127.0.0.1

EOT
RUN bin/elasticsearch-certutil cert --silent --pem -out config/certs/certs.zip --in config/certs/instances.yml --ca-cert config/certs/ca/ca.crt --ca-key config/certs/ca/ca.key;
RUN unzip config/certs/certs.zip -d config/certs;
RUN find . -type f -exec chmod 640 \{\} \;;

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/docker-entrypoint.sh"]
