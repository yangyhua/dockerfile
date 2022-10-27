docker run -dit --name hexo_fluid \
  -v $pwd/.zshrc:/root/.zshrc \
  hexo:$(date "+%y.%m.%d")
