#!/bin/bash
docker build ../. -t wordpress
docker run -it wordpress
