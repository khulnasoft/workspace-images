ARG base
FROM ${base}

ARG NIX_VERSION
ARG NIX_CONFIG=""

ENV NIX_VERSION=${NIX_VERSION}

USER root

# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=1

RUN addgroup --system nixbld \
  && adduser devpod nixbld \
  && for i in $(seq 1 30); do useradd -ms /bin/bash nixbld$i && adduser nixbld$i nixbld; done \
  && mkdir -m 0755 /nix && chown devpod /nix \
  && mkdir -p /etc/nix && echo 'sandbox = false' > /etc/nix/nix.conf

# Install Nix
USER devpod
ENV USER devpod
WORKDIR /home/devpod

RUN curl https://nixos.org/releases/nix/nix-$NIX_VERSION/install | sh

RUN echo '. /home/devpod/.nix-profile/etc/profile.d/nix.sh' >> /home/devpod/.bashrc.d/200-nix
RUN mkdir -p /home/devpod/.config/nixpkgs && echo '{ allowUnfree = true; }' >> /home/devpod/.config/nixpkgs/config.nix
RUN mkdir -p /home/devpod/.config/nix && echo $NIX_CONFIG >> /home/devpod/.config/nix/nix.conf

# Install cachix
RUN . /home/devpod/.nix-profile/etc/profile.d/nix.sh \
  && nix-env -iA cachix -f https://cachix.org/api/v1/install \
  && cachix use cachix

# Install direnv
COPY <<EOF /home/devpod/.config/direnv/config.toml
[whitelist]
prefix = [ "/workspace" ]
EOF
COPY <<EOF /home/devpod/.bashrc.d/999-direnv
source <(direnv hook bash)
EOF
RUN . /home/devpod/.nix-profile/etc/profile.d/nix.sh \
  && nix-env -iA nixpkgs.direnv
