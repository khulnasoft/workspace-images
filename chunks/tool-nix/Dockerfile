ARG base
FROM ${base}

ARG NIX_VERSION
ARG NIX_CONFIG=""

ENV NIX_VERSION=${NIX_VERSION}

USER root

# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=1

RUN addgroup --system nixbld \
  && adduser khulnasoft nixbld \
  && for i in $(seq 1 30); do useradd -ms /bin/bash nixbld$i && adduser nixbld$i nixbld; done \
  && mkdir -m 0755 /nix && chown khulnasoft /nix \
  && mkdir -p /etc/nix && echo 'sandbox = false' > /etc/nix/nix.conf

# Install Nix
USER khulnasoft
ENV USER khulnasoft
WORKDIR /home/khulnasoft

RUN curl https://nixos.org/releases/nix/nix-$NIX_VERSION/install | sh

RUN echo '. /home/khulnasoft/.nix-profile/etc/profile.d/nix.sh' >> /home/khulnasoft/.bashrc.d/200-nix
RUN mkdir -p /home/khulnasoft/.config/nixpkgs && echo '{ allowUnfree = true; }' >> /home/khulnasoft/.config/nixpkgs/config.nix
RUN mkdir -p /home/khulnasoft/.config/nix && echo $NIX_CONFIG >> /home/khulnasoft/.config/nix/nix.conf

# Install cachix
RUN . /home/khulnasoft/.nix-profile/etc/profile.d/nix.sh \
  && nix-env -iA cachix -f https://cachix.org/api/v1/install \
  && cachix use cachix

# Install direnv
COPY <<EOF /home/khulnasoft/.config/direnv/config.toml
[whitelist]
prefix = [ "/workspace" ]
EOF
COPY <<EOF /home/khulnasoft/.bashrc.d/999-direnv
source <(direnv hook bash)
EOF
RUN . /home/khulnasoft/.nix-profile/etc/profile.d/nix.sh \
  && nix-env -iA nixpkgs.direnv
