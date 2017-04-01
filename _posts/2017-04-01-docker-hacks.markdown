---
layout: post
title:  "Docker Hack: Prune those unwanted stuff."
date:   2017-04-01 01:00:00
categories: bits docker
description: "I have been meaning to do this for a very long time and today, I overcame inertia. This is a first in, hopefully, a never ending series that I have aptly titled bits"
image: /assets/article_images/docker/docker.png
---
I have been meaning to do this for a very long time and today, I overcame inertia. This is a first in, hopefully, a never ending series that I have aptly titled bits. The aim of these series is to share my discoveries, hacks and shortcuts with everyday tools that I work with. Sit back, relax and enjoy the ride.

In this first episode of the bit series, I will be sharing a Docker hack. Docker is an amazing piece of software, like every other tool, it has its ways and as engineers, we have to learn those ways. This article isn't meant to talk about what Docker is and is not, the aim here is to showcase one tiny feature I found this week.

As we go around spinning containers, images and volumes, we run the risk of filling up our hard drives very quickly. Luckily, as at version 17.03.1, Docker provides us with a tiny nifty command called `prune`. Here is how it works.

#### Usage
`docker system prune [OPTIONS]` - Remove unused data

#### Options
`--all,  -a` - Remove all unused images including the dangling ones.

`--force, -f` - Do not prompt for confirmation _just do it_.

The command above clears out everything from containers to images and including volumes. While this may not always be what you want, Docker provides us with a more granular version of the `prune` command: container, image and volume pruning.

`docker container prune [OPTIONS]` - Remove all stopped containers
`docker image prune [OPTIONS]` - Remove all unused images
`docker volume prune [OPTIONS]` - Remove all unused volumes

For all three commands above, the only available option is `--force, -f`. The `--force, -f` simply ask Docker to proceed without confirmation.

I recently ran `docker system prune -a -f` and this was what I recovered almost 25GB of hard drive space.

*PS: Used these commands carefully.*