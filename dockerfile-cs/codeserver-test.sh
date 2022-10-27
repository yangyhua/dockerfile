rm /home/dev/code-server-test/.zcompdump-*
docker run -dit --cap-add SYS_PTRACE --name test-codeserver -p 0.0.0.0:8200:8080 \
  -v /home/dev/code-server-test:/home/coder \
  -v /home/dev/certs/yyhua.me/ecc/cert.pem:/certs/cert.pem \
  -v /home/dev/certs/yyhua.me/ecc/key.pem:/certs/key.pem \
  -u "$(id -u):$(id -g)" \
  -e PASSWORD=HAPPYCoding \
  yyhua/code-server-py:latest --cert /certs/cert.pem --cert-key /certs/key.pem
