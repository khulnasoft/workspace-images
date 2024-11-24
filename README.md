# Workspace Images

[![Khulnasoft ready-to-code](https://img.shields.io/badge/Khulnasoft-ready--to--code-908a85?logo=khulnasoft)](https://khulnasoft.com/#https://github.com/khulnasoft/workspace-images)
[![Build from Main](https://github.com/khulnasoft/workspace-images/actions/workflows/push-main.yml/badge.svg)](https://github.com/khulnasoft/workspace-images/actions/workflows/push-main.yml)

Ready-to-use Docker images for [khulnasoft.com](https://www.khulnasoft.com) workspaces.
All images are available on [Khulnasoft's Docker Hub page](https://hub.docker.com/u/khulnasoft).

For an example of how to use these images, please take a look at the [documentation](https://www.khulnasoft.com/docs/configure/workspaces/workspace-image#configure-a-public-docker-image).

## 📢 Announcements

We upgraded to support [dazzle v2](https://github.com/khulnasoft/dazzle) and build with GitHub Actions.

## Summary

- **Operating System**: Ubuntu 22.04.3 LTS
- **OS Type**: Linux
- **Architecture**: x86_64

## Images

By default, Khulnasoft uses a standard Docker Image called
[`workspace-full`](https://github.com/khulnasoft/workspace-images/blob/HEAD/dazzle.yaml#L23) as the foundation for workspaces.

Workspaces started based on this default image come pre-installed with
Docker, Nix, Go, Java, Node.js, C/C++, Python, Ruby, Rust & PHP as well as tools such as Homebrew, Tailscale, Nginx & several more.

If this image does not include the tools you need for your repository, we recommend you start with
[`workspace-base`](https://github.com/khulnasoft/workspace-images/blob/HEAD/dazzle.yaml#L3) and customize it according to your needs.
You can refer to this [document to setup a custom docker image](https://www.khulnasoft.com/docs/configure/workspaces/workspace-image).

### 📷 Images we'll maintain

- [`khulnasoft/workspace-full`](https://hub.docker.com/r/khulnasoft/workspace-full) ✅
- [`khulnasoft/workspace-base`](https://hub.docker.com/r/khulnasoft/workspace-base) ✅
- [`khulnasoft/workspace-dotnet`](https://hub.docker.com/r/khulnasoft/workspace-dotnet) ✅
- [`khulnasoft/workspace-full-vnc`](https://hub.docker.com/r/khulnasoft/workspace-full-vnc) ✅
- [`khulnasoft/workspace-mongodb`](https://hub.docker.com/r/khulnasoft/workspace-mongodb) ✅
- [`khulnasoft/workspace-mysql`](https://hub.docker.com/r/khulnasoft/workspace-mysql) ✅
- [`khulnasoft/workspace-postgres`](https://hub.docker.com/r/khulnasoft/workspace-postgres) ✅

### 🆕 Specific Images

These are lightweight compared to `khulnasoft/workspace-full`.

Each contains a set of chunks: a common base and a language / tool. Every image also comes with Docker and Tailscale preinstalled.

- [`khulnasoft/workspace-c`](https://hub.docker.com/r/khulnasoft/workspace-c) ✅
- [`khulnasoft/workspace-clojure`](https://hub.docker.com/r/khulnasoft/workspace-clojure) ✅
- [`khulnasoft/workspace-go`](https://hub.docker.com/r/khulnasoft/workspace-go) ✅
- [`khulnasoft/workspace-java-11`](https://hub.docker.com/r/khulnasoft/workspace-java-11) ✅
- [`khulnasoft/workspace-java-17`](https://hub.docker.com/r/khulnasoft/workspace-java-17) ✅
- [`khulnasoft/workspace-java-21`](https://hub.docker.com/r/khulnasoft/workspace-java-21) ✅
- [`khulnasoft/workspace-java-21`](https://hub.docker.com/r/khulnasoft/workspace-java-23) ✅
- [`khulnasoft/workspace-node`](https://hub.docker.com/r/khulnasoft/workspace-node) ✅
- [`khulnasoft/workspace-node-lts`](https://hub.docker.com/r/khulnasoft/workspace-node-lts) ✅
- [`khulnasoft/workspace-node-18`](https://hub.docker.com/r/khulnasoft/workspace-node-18) ✅
- [`khulnasoft/workspace-node-20`](https://hub.docker.com/r/khulnasoft/workspace-node-20) ✅
- [`khulnasoft/workspace-node-22`](https://hub.docker.com/r/khulnasoft/workspace-node-22) ✅
- [`khulnasoft/workspace-node-23`](https://hub.docker.com/r/khulnasoft/workspace-node-23) ✅
- [`khulnasoft/workspace-python`](https://hub.docker.com/r/khulnasoft/workspace-python) ✅
- [`khulnasoft/workspace-python-3.9`](https://hub.docker.com/r/khulnasoft/workspace-python-3.9) ✅
- [`khulnasoft/workspace-python-3.10`](https://hub.docker.com/r/khulnasoft/workspace-python-3.10) ✅
- [`khulnasoft/workspace-python-3.11`](https://hub.docker.com/r/khulnasoft/workspace-python-3.11) ✅
- [`khulnasoft/workspace-python-3.12`](https://hub.docker.com/r/khulnasoft/workspace-python-3.12) ✅
- [`khulnasoft/workspace-python-3.13`](https://hub.docker.com/r/khulnasoft/workspace-python-3.13) ✅
- [`khulnasoft/workspace-ruby-3`](https://hub.docker.com/r/khulnasoft/workspace-ruby-3) ✅
- [`khulnasoft/workspace-ruby-3.1`](https://hub.docker.com/r/khulnasoft/workspace-ruby-3.1) ✅
- [`khulnasoft/workspace-ruby-3.2`](https://hub.docker.com/r/khulnasoft/workspace-ruby-3.2) ✅
- [`khulnasoft/workspace-ruby-3.3`](https://hub.docker.com/r/khulnasoft/workspace-ruby-3.3) ✅
- [`khulnasoft/workspace-rust`](https://hub.docker.com/r/khulnasoft/workspace-rust) ✅
- [`khulnasoft/workspace-elixir`](https://hub.docker.com/r/khulnasoft/workspace-elixir) ✅
- [`khulnasoft/workspace-nix`](https://hub.docker.com/r/khulnasoft/workspace-nix) ✅
- [`khulnasoft/workspace-yugabytedb`](https://hub.docker.com/r/khulnasoft/workspace-yugabytedb) ✅
- [`khulnasoft/workspace-yugabytedb-preview`](https://hub.docker.com/r/khulnasoft/workspace-yugabytedb-preview) ✅

#### Versions we'll maintain

For images dedicated to Java, Node, Python and Ruby, their lifecycle generally works as follows:

- If an image does not have a version in its name, we try to keep it at its latest stable version
- If an image is versioned (like `workspace-python-3.12`), we'll support it until it reaches End of Life

### 🎬 No upgrade planned

⚠️ These images are no longer being published, and are not planned for Upgrade:

- khulnasoft/workspace-images-dazzle
- khulnasoft/workspace-dotnet-vnc
- khulnasoft/workspace-dotnet-lts
- khulnasoft/workspace-dotnet-lts-vnc
- khulnasoft/workspace-flutter
- khulnasoft/workspace-gecko
- khulnasoft/workspace-wasm
- khulnasoft/workspace-firefox
- khulnasoft/workspace-full-dazzle
- khulnasoft/workspace-mysql-8
- khulnasoft/workspace-python-tk-vnc
- khulnasoft/workspace-python-tk
- khulnasoft/workspace-rethinkdb
- khulnasoft/workspace-thin
- khulnasoft/workspace-webassembly

## Contributing

You can follow the detailed guide on how to contribute [here](CONTRIBUTING.md).

[![Open in Khulnasoft](https://khulnasoft.com/button/open-in-khulnasoft.svg)](https://khulnasoft.com/#https://github.com/khulnasoft/workspace-images)

## Where to follow new updates

- **Announcements**: Significant changes and breaking updates are announced through the [CHANGELOG.md](/CHANGELOG.md) file with details.
- **Recently Merged Changes**: For checking new features or updates staged for next deployment that don't warrant everyone's attention, browse through the [merged pull requests](https://github.com/khulnasoft/workspace-images/pulls?q=is%3Apr+is%3Amerged).
- **Image Updates**: Every Monday, [a GitHub action](https://github.com/khulnasoft/workspace-images/actions/workflows/dockerhub-release.yml?query=is%3Asuccess) automatically builds and updates the images based on the `main` branch. Once built, these images are made available on [Khulnasoft's Docker Hub](https://hub.docker.com/u/khulnasoft).
