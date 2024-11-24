ARG base
FROM ${base}

USER khulnasoft

# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=1

RUN sudo apt-get install -y --only-upgrade ca-certificates
