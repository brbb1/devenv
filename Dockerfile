FROM golang

# base apps
RUN apt-get update && apt-get install -y \
    curl \ 
    git \
    ranger \
    neovim \
    universal-ctags

RUN mkdir -p ~/.config/nvim
RUN git clone https://github.com/brbb1/devenv.git ~/root/tmp
RUN mv ~/root/tmp/init.vim ~/.config/nvim/init.vim
RUN rm -fr ~/root/tmp

RUN curl -fsSL https://deb.nodesource.com/setup_17.x | apt-get install -y nodejs
