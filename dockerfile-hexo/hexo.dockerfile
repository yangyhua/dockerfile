FROM node:lts
WORKDIR /root
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free' >> /root/sources.list \
    && echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free' >> /root/sources.list \
    && echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free' >> /root/sources.list \
    && echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free' >> /root/sources.list \
    && mv /root/sources.list /etc/apt/ \
    && apt-get update -y \
    #&& apt-get install zsh -y \
    #&& chsh -s /usr/bin/zsh \
    && apt-get clean \
    && npm install -g hexo-cli \
    && npm install hexo-deployer-git --save \
    && npm install --save hexo-theme-fluid \
    && npm uninstall hexo-renderer-marked --save \
    && npm install hexo-renderer-markdown-it --save \
    && hexo clean \
    && hexo init blog \
COPY ./blog /root/blog
RUN cd /root/blog \
    && npm install \
    && hexo clean 
