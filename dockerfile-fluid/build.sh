#!/bin/bash
docker pull node:lts
docker build -t hexo-fluid -f hexo-fluid.dockerfile --no-cache .
