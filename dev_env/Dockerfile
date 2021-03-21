FROM debian

ADD ./.rgignore /tmp
ADD ./.vimrc /tmp
ADD ./.bashrc /tmp
ADD ./.ycm_extra_conf.py /tmp


# --------------------------- 通过apt安装 ---------------------------

RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install gcc -y
RUN apt-get install g++ -y
RUN apt-get install python -y
RUN apt-get install python3 -y
RUN apt-get install python-dev -y
RUN apt-get install python3-dev -y
RUN apt-get install libncurses5-dev -y
RUN apt-get install git -y
RUN apt-get install make -y
RUN apt-get install cmake -y
RUN apt-get install ripgrep -y
RUN apt-get install tmux -y
RUN apt-get install ctags -y
RUN apt-get install cscope -y
RUN apt-get install libboost-all-dev -y


# ---------------------------- 其它配置 -------------------

RUN cat /tmp/.bashrc >> /etc/profile \
	&& echo ". /etc/profile" >> ~/.bashrc

# ---------------------------- 通过源码安装 -------------------

# golang
RUN cd /tmp && wget https://golang.org/dl/go1.16.2.linux-amd64.tar.gz \
	&& rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.2.linux-amd64.tar.gz

# vim
RUN cd /tmp && git clone https://github.com/vim/vim.git \
	&& cd vim \
	&& ./configure --prefix=/usr --enable-luainterp=yes --enable-mzschemeinterp --enable-perlinterp=yes  --enable-python3interp=yes --enable-tclinterp=yes --enable-rubyinterp=yes --enable-cscope --enable-terminal --enable-autoservername --enable-multibyte --enable-xim --enable-fontset --with-modified-by=shlian --with-compiledby=shlian  --with-python3-command=python3 \
	&& make clean && make -j8 && make install

# vim插件
RUN cd /usr/share/vim \
	&& cp /tmp/.vimrc ./vimrc \
	&& cp /tmp/.rgignore . \
	&& mkdir -p .vim/bundle \
	&& git clone https://github.com/VundleVim/Vundle.vim .vim/bundle/Vundle.vim \
	&& vim -c "PluginInstall" -c "qa!"
RUN export PATH=$PATH:/usr/local/go/bin \
	&& cd /usr/share/vim/.vim/bundle/YouCompleteMe \
	&& cat /tmp/.ycm_extra_conf.py >> .ycm_extra_conf.py \
	&& python3 install.py --clang-completer --go-completer

RUN rm -rf /tmp/*
