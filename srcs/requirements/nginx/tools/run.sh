#!/bin/bash
docker build ../. -t nginx
docker run nginx
