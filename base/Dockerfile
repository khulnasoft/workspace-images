FROM buildpack-deps:jammy@sha256:1a63cc50ec6f4f45440121af59c47f78ca390607714ac0886c1588d118526b40

# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=2

COPY install-packages upgrade-packages /usr/bin/

### base ###
RUN yes | unminimize \
    && install-packages \
    zip \
    unzip \
    bash-completion \
    build-essential \
    ninja-build \
    clang \
    htop \
    iputils-ping \
    jq \
    less \
    locales \
    man-db \
    nano \
    ripgrep \
    software-properties-common \
    sudo \
    stow \
    time \
    emacs-nox \
    vim \
    multitail \
    lsof \
    ssl-cert \
    fish \
    zsh \
    rlwrap \
    && locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8

### Update and upgrade the base image ###
RUN upgrade-packages

### Git ###
RUN add-apt-repository -y ppa:git-core/ppa
# https://github.com/git-lfs/git-lfs/blob/main/INSTALLING.md
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN install-packages git git-lfs

### Devpod user ###
# '-l': see https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user
RUN useradd -l -u 33333 -G sudo -md /home/devpod -s /bin/bash -p devpod devpod \
    # Remove `use_pty` option and enable passwordless sudo for users in the 'sudo' group
    && sed -i.bkp -e '/Defaults\tuse_pty/d' -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers \
    # To emulate the workspace-session behavior within dazzle build env
    && mkdir /workspace && chown -hR devpod:devpod /workspace

ENV HOME=/home/devpod
WORKDIR $HOME
# custom Bash prompt
RUN { echo && echo "PS1='\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$(__git_ps1 \" (%s)\") $ '" ; } >> .bashrc

COPY default.gitconfig /etc/gitconfig
COPY --chown=devpod:devpod default.gitconfig /home/devpod/.gitconfig

# configure git-lfs
RUN git lfs install --system --skip-repo

### Devpod user (2) ###
USER devpod
# use sudo so that user does not get sudo usage info on (the first) login
RUN sudo echo "Running 'sudo' for Devpod: success" && \
    # create .bashrc.d folder and source it in the bashrc
    mkdir -p /home/devpod/.bashrc.d && \
    (echo; echo "for i in \$(ls -A \$HOME/.bashrc.d/); do source \$HOME/.bashrc.d/\$i; done"; echo) >> /home/devpod/.bashrc && \
    # create a completions dir for devpod user
    mkdir -p /home/devpod/.local/share/bash-completion/completions

# Custom PATH additions
ENV PATH=$HOME/.local/bin:/usr/games:$PATH
