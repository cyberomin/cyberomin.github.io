---
layout: post
title:  "Connecting to MySQL on a Docker container."
date:   2016-01-12 07:54:00
categories: tutorial,docker
description: "If you’re like me, you’re probably just getting to the Docker party. Today I ran into what some will consider a noob problem — I wanted to connect to my MySQL container, but didn’t know how to go about it."

---

If you’re like me, you’re probably just getting to the Docker party. Today I ran into what some will consider a noob problem &mdash; I wanted to connect to my MySQL container but didn’t know how to go about it.

This mini tutorial isn’t supposed to take you through the entire container setup et al. It is meant to help you connect a MySQL GUI to a Docker container.

From your terminal, run `docker ps` and you should see a list of active containers

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                     NAMES
fe66288216eb        mysql               "/entrypoint.sh mysql"   9 hours ago         Up 9 hours          0.0.0.0:32769->3306/tcp   sso_mysql
2d98e86de990        redis               "/entrypoint.sh redis"   9 hours ago         Up 9 hours          0.0.0.0:32768->6379/tcp   sso_redis
```

From my list, you could see that the first container is a MySQL image and this is what we want to connect to. Focus on the column with the PORTS. MySQL is mapped to port `32769`, that means that the docker machine's IP is listening on port `32779` and forwarding it to the "internal" (MySQL docker) port `3306.`

Then run `docker-machine ip default`, it should tell you the IP of the Docker machine. This is the MySQL host you will be connecting to.
Mine is `192.168.99.100`. That’s it. That simple.

<img src="{{ site.url }}/assets/article_images/docker/docker.png"/>
<em style="color:#666; font-size:13px">SequelPro</em>