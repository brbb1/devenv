FROM golang

# base apps
RUN apt-get update && apt-get install -y \
    curl \ 
    git \
    ranger \
    neovim


