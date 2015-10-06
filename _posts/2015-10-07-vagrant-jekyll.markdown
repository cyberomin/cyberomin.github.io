---
layout: post
title:  "Vagrant and Jekyll, a match made in heaven."
date:   2015-10-07 00:39:00
categories: startup
description: "How to use Jekyll with vagrant."
---

<p>If you have been following my Twitter timeline for a while now, you will notice my unwavering love for Vagrant. To think that this technology has existed for almost 5yrs now and I’m only getting to use it is beyond me.</p>

<p><strong>Context</strong><br/>
A little bit of background knowledge, Vagrant is this awesome tool that was started by Mitchell Hashimoto, vagrant helps you configure and provision disposable virtual development environment. At its core, it help solves the excuse of <i>it works on my machine.</i></p>

<p>
I gush about the awesomeness of Vagrant like every other day. Vagrant is a life saver.
I decided to move my blog, this very one and make it Vagrant ready. Why? Why not? Vagrant is cool...
</p>

<p>
The process was really straight forward and well streamlined. I used a custom box for this purpose. Any other box will suffice. Here is what I did.
</p>

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "servlet"
  config.vm.hostname = "cyberomin.blog"
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  config.vm.provision :shell, :path => "vagrant/setup.sh"
  config.vm.synced_folder ".", "/vagrant", group: "www-data", owner: "www-data"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "CyberOmin Blog"
    vb.memory = "2048"
  end

  config.ssh.forward_agent = true
end
```

<p>
From the <code>Vagrant</code> file above, you notice I have forwarded the http port to 4000. Jekyll, the framework upon which GitHub pages depends on runs on port 4000.
</p>

```bash
#!/bin/bash

SERVICE="CyberOmin Blog"
echo "Provisioning Development Environment for: $SERVICE"

echo "Updating environment"
sudo apt-get update -y
#sudo apt-get upgrade -y

echo "Installing Ruby and"
sudo apt-get install ruby ruby-dev make gcc nodejs -y

echo "Installing Jekyll"
sudo gem install jekyll --no-rdoc --no-ri

```

<p>
I set up a generic bash script for provisioning. Nothing serious, I just automated the installation of Ruby, Jekyll and 
its dependencies. I added <code>--no-rdoc</code> flag that tells the installation to skip the installation of Jekyll's documentation. 
</p>

<p>
With the steps above, I now have a ready and fully functional box that I can call up and destroy at will.
</p>

The result is what we have here
<img src="{{ site.url }}/assets/article_images/vagrant/blog.png"/ style="width:700px; height:auto;">