git clone git@github.com:yangyhua/blog.git
docker pull node:lts
docker build -t hexo:$(date "+%y.%m.%d") -f hexo.dockerfile --no-cache .
rm -rf blog