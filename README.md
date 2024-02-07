# Cris cli
[![Go Binary](https://github.com/cmarquezrusso/cris/actions/workflows/go.yml/badge.svg)](https://github.com/cmarquezrusso/cris/actions/workflows/go.yml)
[![Docker Image CI](https://github.com/cmarquezrusso/cris/actions/workflows/docker-image.yml/badge.svg)](https://github.com/cmarquezrusso/cris/actions/workflows/docker-image.yml)
[![Release](https://github.com/cmarquezrusso/cris/actions/workflows/go-release.yml/badge.svg)](https://github.com/cmarquezrusso/cris/actions/workflows/go-release.yml)

Testing how to create a cobra terminal client. 

# Features

- Using cobra-cli to generate commands
- Send Notification

# Installation

> curl -sfL https://raw.githubusercontent.com/cmarquezrusso/cris/main/install.sh | env version=latest bash 

# Developing

Preconditions:

- Golang installed (I am using dotfiles and asdf)
- Git clone repo
- Docker:
    just do docker build, docker start.
- make all

I am using the cobra-cli to add new commands.

I am also using docker and Make to create the binaries for the main platforms: Windows, Linux, ARM, Darwin and Darwin M*

# Test

Go test to start with, or run

```
make test
```

# Demo

WIP 

Asciinema here

# Version 

Cris - v0.0.4
