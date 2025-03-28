ARG base
FROM ${base}

ARG DOTNET_VERSION

USER devpod
# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=1

ENV DOTNET_VERSION=${DOTNET_VERSION}

# Install .NET SDK (Current channel)
# Source: https://docs.microsoft.com/dotnet/core/install/linux-scripted-manual#scripted-install
RUN mkdir -p /home/devpod/dotnet && curl -fsSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version ${DOTNET_VERSION} --install-dir /home/devpod/dotnet
ENV DOTNET_ROOT=/home/devpod/dotnet
ENV PATH=/home/devpod/dotnet:$PATH

# TODO(toru): Remove this hack when the kernel bug is resolved.
#             ref. https://github.com/khulnasoft/devpod/issues/8901
RUN bash \
    && { echo 'if [ ! -z $KHULNASOFT_REPO_ROOT ]; then'; \
        echo '\tCONTAINER_DIR=$(awk '\''{ print $6 }'\'' /proc/self/maps | grep ^\/run\/containerd | head -n 1 | cut -d '\''/'\'' -f 1-6)'; \
        echo '\tif [ ! -z $CONTAINER_DIR ]; then'; \
        echo '\t\t[[ ! -d $CONTAINER_DIR ]] && sudo mkdir -p $CONTAINER_DIR && sudo ln -s / $CONTAINER_DIR/rootfs'; \
        echo '\tfi'; \
        echo 'fi'; } >> /home/devpod/.bashrc.d/110-dotnet
RUN chmod +x /home/devpod/.bashrc.d/110-dotnet
