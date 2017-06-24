---
layout: post
title:  "Terraform: Infrastructure as code - Part II"
date:   2017-06-24 04:00:00
categories: engineering
description: "In Part I, I introduced us to the concept of IAC(Infrastructure as Code) using Terraform, and we explored the awesomeness of Terraform"
---
<img src="{{ site.url }}/assets/article_images/terraform/terraform.png"/>

In Part I, I introduced us to the concept of IAC(Infrastructure as Code) using Terraform, and we explored the awesomeness of Terraform. While the code we used in Part I for provisioning a simple server did work very well, the system we eventually provisioned is hardly a scalable system and not one I’ll recommend for production use. The reasoning here is simple, running a single server for your entire application is almost as bad as lighting a match in a gas station, bad things can and will definitely happen. And I’ll strongly suggest that you refrain from this setup. 

In this second part of our IAC series, I’ll want us to build upon what we started in Part I and we will try to build a semi-highly available system. In Code X of Part I, we had created one server with the following code:

{% highlight javascript %}
resource "digitalocean_droplet" "web" {
  image = "ubuntu-16-04-x64"
  name = "web-1"
  region = "lon1"
  size = "1gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}
{% endhighlight %}
*Code I*

Now let’s expand on this code and create two web servers. To do this, we will add a meta-parameter called `count`. The count parameter can be added to any resource and it simply creates more of the declared resource based on the count value. For instance, we will add `count = 2` to create two web servers. 

{% highlight javascript %}
resource "digitalocean_droplet" "web" {
  image = "ubuntu-16-04-x64"
  name = "web-1"
  count = 2
  region = "lon1"
  size = "1gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}
{% endhighlight %}
*Code II*

Notice the introduction of `count = 2` in the code above? Now that’s how we create 2 web servers. If we wanted to create 10 web servers, all that we need do is to change the value of count to 10, if we need 20 servers, we change the value of count to 20, you get the idea. 

The next thing that we will do to build our semi-highly available system is to create a load balancer and distribute traffic to all of our servers. Terraform provides us with a `digitalocean_loadbalancer` resource and we will make use of it.

Adding a load balancer is simple, we will declare a load balancer resource, give it a name, choose a region, apply the traffic forwarding rules, add a health check from the load balancers to the attached machines and finally, attached our Digital Ocean droplets to these load balancers. That simple. 

{% highlight javascript %}
resource "digitalocean_droplet" "web" {
  image = "ubuntu-16-04-x64"
  name = "web-1"
  count = 2
  region = "lon1"
  size = "1gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "digitalocean_loadbalancer" "public_lb" {
  name = "web-lb"
  region = "lon1"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }
    
  algorithm = "round_robin"

  droplet_ids = ["${digitalocean_droplet.web.id}"]
}
{% endhighlight %}
*Code III*

From the code above, we added a public load balancer to our infrastructure. The *name* and *region* are pretty self-explanatory and both are required as also the forwarding rule. The forwarding rule basically tells us how to send traffic. The protocol of choice for our load balancer is HTTP which has a default port of 80. The `entry_protocol` and `entry_port` simply states how traffic is being sent to the load balancer and the `target_port` and `target_protocol` talks about how traffic gets to the attached droplets. It’s that simple. 

The next important bit here is the connection algorithm between the load balancer and the droplets. In the case, we choose round robin. Although Terraform only supports two sets of algorithms for Digital Ocean’s load balancer resource &mdash; Round Robin(round_robin) and Least Connections(least_connections) &mdash; other load balancing algorithm exist like Weighted Round Robin, Least Traffic, Source IP, etc.  

>A round robin is an arrangement of choosing all elements in a group equally in some rational order, usually from the top to the bottom of a list and then starting again at the top of the list and so on. A simple way to think of round robin is that it is about "taking turns." Used as an adjective, round robin becomes "round-robin.” - [WhatIs](http://whatis.techtarget.com/definition/round-robin).

In the last section of our load balancer resource block, we attach our droplets to the load balancer using `droplet_ids`. We use string interpolation to reference the droplet ids, this, is how Terraform builds its dependency graph. There is a convention to using interpolation in Terraform, it follows the pattern of **${RESOURCE_TYPE.RESOURCE_NAME.ATTRIBUTE_NAME}**. In our case here, we are referencing the `digitalocean_droplets` resource with the name of `web` and we are getting all its `id` attributes. 

With the set up above, we have been able to put together a simple layer 4 load balancing. The only missing bit here is a database server. 

<img src="{{ site.url }}/assets/article_images/terraform/load_balancing.png"/>
<small>Image credit: Digital Ocean</small>

Adding a database is simple, unlike AWS, Digital Ocean, as of the time of this article, does not offer a managed database service like RDS. We will need to roll out our own manually. To do that, we will create a droplet resource, just like we did for the web. The code in Code VI does exactly that for us. 

{% highlight javascript %}
resource "digitalocean_droplet" "web" {
  image = "ubuntu-16-04-x64"
  name = "web-1"
  count = 2
  region = "lon1"
  size = "1gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "digitalocean_droplet" "database" {
  image = "ubuntu-16-04-x64"
  name = "web-1"
  region = "lon1"
  size = "1gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "digitalocean_loadbalancer" "public_lb" {
  name = "web-lb"
  region = "lon1"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }
    
  algorithm = "round_robin"
  droplet_ids = ["${digitalocean_droplet.web.id}"]
}
{% endhighlight %}
*Code VI*

To get thing going and see its effect, we run `terraform plan` just to make sure things are fine and well sorted, then we run `terraform apply` to build the actual system. With the setup in Code VI, we have successfully built ourselves a simple infrastructure that is good enough to host a decent blog. In the next part of this series, we will talk about how to prepare our machine right after provisioning and install basic software on it. 


*Disclaimer*

*While following the examples outlined in this article, please bear in mind that there’s a cost attached to it. When you run `terraform plan` then `terraform apply` and create a real resource at your provider’s end, they start billing you almost immediately. As a word of caution and this apply only in a non-production environment, always try to clean after yourself. For this purpose, Terraform offers us a really handy command called `terraform destroy`. The `terraform destroy` command literally goes back to your provider and delete/destroy every single resource that you have created.  This is a one-way command and cannot be undone, so I strongly advise you do this in your personal or experimental environment.*
