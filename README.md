# XoruX Docker Image
This is the Git repo of the Docker image for [XoruX](https://www.xorux.com) applications - [LPAR2RRD](http://www.lpar2rrd.com) & [STOR2RRD](http://www.stor2rrd.com).

This docker image is based on official [Debian 8 (Jessie)](https://hub.docker.com/_/debian) with all necessary dependencies installed.

Quick start:

    docker run -d -p 8080:80 xorux/apps

 - web GUI on http://localhost:8080
 - set timezone for running container
 - continue to LPAR2RRD and use admin/admin as username/password
 - or continue to STOR2RRD and use admin/admin as username/password

You can connect via SSH on port 22 (exposed), username **lpar2rrd**, password **xorux4you** - please change it ASAP.
