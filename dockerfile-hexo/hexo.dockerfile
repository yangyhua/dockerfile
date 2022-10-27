FROM node:lts
ARG SSH_PRIVATE_KEY
WORKDIR /root
RUN mkdir /root/.ssh/ && echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa \
    && chmod 600 /root/.ssh/id_rsa && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts \
    ##mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    #&& echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free' >> /root/sources.list \
    #&& echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free' >> /root/sources.list \
    #&& echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free' >> /root/sources.list \
    #&& echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free' >> /root/sources.list \
    #&& mv /root/sources.list /etc/apt/ \
    && apt-get update -y \
    && apt-get install zsh -y \
    && apt-get clean \
    && chsh -s /usr/bin/zsh \
    && git clone git@github.com:ohmyzsh/ohmyzsh.git \
    && mv /root/ohmyzsh /root/.oh-my-zsh \ 
    && wget https://raw.githubusercontent.com/yangyhua/dockerfile/main/dockerfile-hexo/.zshrc \
    && npm install -g hexo-cli \
    && npm install hexo-deployer-git --save \
    && npm install --save hexo-theme-fluid \
    && npm uninstall hexo-renderer-marked --save \
    && npm install hexo-renderer-markdown-it --save \
    && git clone git@github.com:yangyhua/blog.git \
    && cd /root/blog \
    && npm install \
    && hexo clean 
