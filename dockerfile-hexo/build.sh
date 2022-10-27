docker pull node:lts
docker build --build-arg SSH_PRIVATE_KEY="$(cat ~/.ssh/id_rsa)" -t hexo:$(date "+%y.%m.%d") -f hexo.dockerfile --no-cache .
