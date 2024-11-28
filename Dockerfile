FROM ubuntu

RUN apt-get update
RUN apt-get -y install build-essential python3-dev automake cmake git \
flex bison libglib2.0-dev libpixman-1-dev python3-setuptools cargo libgtk-3-dev \
python3-pip
RUN pip3 install wheel
RUN git clone https://github.com/AFLplusplus/AFLplusplus
RUN git clone https://github.com/0xsirus/arvin
RUN pip3 install angr

RUN cd root

# install AstroNvim and tmux
RUN apt-get -y install ninja-build gettext \
libtool libtool-bin autoconf vim \
automake cmake g++ pkg-config tmux\
unzip 
RUN apt-get -y install ripgrep
RUN git clone https://github.com/neovim/neovim && cd neovim
#command 1 RUN make CMAKE_BUILD_TYPE=RelWithDebInfo && make install

RUN cd .. && mkdir .config && cd .config
RUN git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
#command 2 RUN exec $SHELL -l

RUN cd ..

#after that we need to make afl(make distrib, make install), neovim(command 1, command 2).
#see https://zenn.dev/chot/articles/72bc7dfbec3b33
