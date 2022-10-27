docker pull codercom/code-server
docker build -t yyhua/code-server-py -f py.dockerfile --no-cache .
docker build -t yyhua/code-server-cpp -f cpp.dockerfile --no-cache .