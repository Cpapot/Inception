#!/bin/bash
docker build ../. -t mariadb
docker run -it mariadb
