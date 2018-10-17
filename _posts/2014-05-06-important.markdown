---
layout: post
title:  "!important"
date:   2014-05-06 12:14:14
categories: css
---

One of my primary task at my day job is sending out daily newsletter to our teeming customers. As with every other thing web, I have to test my letters across multiple clients: web, mobile and desktop/native.

Google in its infinite wisdom decided to re-colour my links even down to plain text. If you have ever dealt with newsletters you will know that there isn’t so much flexibility - 600px max-width, inline CSS and loads of tables. Let’s not get started on mobile devices, that’s a post for another day.

I spent days trying to figure out what I did or was doing wrong. Why can’t things like links be any simpler? Google why try to complicate my life? <em>Don’t be Evil</em> - pun intended. Y!, Hotmail and co will render just fine, Google? No.

We all have heard about the buzz phrase “best practices, right?” I have. That said, many scholars and “experts” will cuss and swear if you ever mentioned you  use(d) <strong>!important</strong> in your style sheet. You are automatically labeled an outcast. 

Now here’s the thing, I work at a company that defies the status quo. We believe in done is better than perfect, with this in mind I threw away my best practices hat. I used <strong>!important</strong>.

{% highlight css %}
color: #000 !imprtant
{% endhighlight %}


Boom, Google got the message. My letter now have a similar resemblance with my mock-ups. 

So, when next you are faced with these kinds of issues, bite the bullet and throw away the “best practices” hat. Become the rebel. Use <b>!important</b>. :-)