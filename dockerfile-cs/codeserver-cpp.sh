rm /home/dev/code-server-cpp/.zcompdump-*
docker run -dit --cap-add SYS_PTRACE --name cpp-codeserver -p 0.0.0.0:8100:8080 \
  -v /home/dev/code-server-cpp:/home/coder \
  -v /home/dev/certs/yyhua.me/ecc/cert.pem:/certs/cert.pem \
  -v /home/dev/certs/yyhua.me/ecc/key.pem:/certs/key.pem \
  -u "$(id -u):$(id -g)" \
  -e PASSWORD=HAPPYCoding \
  yyhua/code-server-cpp:latest --cert /certs/cert.pem --cert-key /certs/key.pem
