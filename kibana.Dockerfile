ARG STACK_VERSION

FROM docker.elastic.co/kibana/kibana:${STACK_VERSION}
ADD --chown=kibana:root --chmod=750 ./certs/ /usr/share/kibana/config/certs
COPY kibana-entrypoint.sh /usr/local/bin/
#ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/kibana-entrypoint.sh && exec \"$@\"", "--"]
#ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/kibana-entrypoint.sh && exec \"$@\"", "--"]
CMD ["/usr/local/bin/kibana-entrypoint.sh"]
