FROM node:lts
WORKDIR /root
RUN npm install -g hexo-cli \
    && wget https://github.com/fluid-dev/hexo-theme-fluid/raw/master/_config.yml \
    && hexo init blog \
    && cd /root/blog \
    && npm install \
    && npm install --save hexo-theme-fluid \
    && mv /root/_config.yml _config.fluid.yml \
    && sed -i 's/theme: landscape/theme: fluid/g' _config.yml \
    && rm _config.landscape.yml \
    && hexo clean 
