FROM codercom/code-server:latest
RUN sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free' >> /home/coder/sources.list \
    && echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free' >> /home/coder/sources.list \
    && echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free' >> /home/coder/sources.list \
    && echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free' >> /home/coder/sources.list \
    && sudo mv /home/coder/sources.list /etc/apt/ \
    && sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y fonts-powerline build-essential gdb vim \
    && sudo apt-get clean 
