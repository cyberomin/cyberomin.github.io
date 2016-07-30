---
layout: post
title:  "Konga EZ: Our Progressive Web Apps Journey"
date:   2016-07-30 02:10:00
categories: engineering
description: "About a month ago, Konga’s Director of Engineering was at the Progressive Web App (PWA) submit which was organised by Google to talk about how Konga was leveraging on PWA to deliver a consistent experience to its users."
---

About a month ago, Konga’s Director of Engineering was at the Progressive Web App (PWA) submit which was organised by Google to talk about how Konga was leveraging on PWA to deliver a consistent experience to its users.

This will not the time Konga has be featured at a global event of this sort, but what was quite different this time was the fact that the company's Director of Engineering was actually on stage to not just to talk about the app, but also to share the decision that led to this effort in the first place.

It's worthy of note that Progressive Web Apps isn't just another buzz word. It's a decent piece of technology that will have profound impact on user experience across the mobile spectrum.

Progressive Web Apps, though fairly new, has caught up quite quickly and it's fast becoming the defacto way of building web apps for mobile. Amongst other things, PWA gives you the ability to build a near native mobile app experience on the web. Little wonder companies like Flipkart and Alibaba is favouring it over the standard mobile optimised website.

#### So what exactly is a progressive web app?
>"Progressive Web App (PWA) is a term used to denote a new software development methodology. Unlike traditional applications, Progressive Web App can be seen as an evolving hybrid of regular web pages (or websites) and a mobile application. This new application life-cycle model combines features offered by most modern browsers with benefits of mobile experience." — Wikipedia.

#### Why?
From internal data and assessment, it was discovered that the mobile optimised version of Konga was approximately 2MB, despite best efforts to optimised and serve mobile-first content. This doesn't only degrade the entire experience, it cost the user&mdash;data cost&mdash;a lot more when browsing our website from a mobile device.

<img src="{{ site.url }}/assets/article_images/konga-pwa/data.png" style="border-top:solid 1px #CCC;"/>

It's no news to any industry observer that Africa is a mobile first continent—[Mary Meeker, famously declared Nigeria as the most mobilised country in the world](http://cyberomin.github.io/mobile/2015/07/05/embrace-mobile-dont-ignore-it.html)—as such, investing in a mobile is a strategy shouldn’t be an afterthought. This reality isn't different from what we have seen at Konga. A large portion of our user base consume our services from mobile devices and we owe it to them to provide the best possible mobile experience.

<img src="{{ site.url }}/assets/article_images/konga-pwa/traffic.png" style="border-left:solid 1px #CCC;"/>

While our existing mobile website isn't inherently bad, PWA allows us to take advantage of some native mobile capabilities and provides us with a platform to build an offline-first system. This makes really good sense if you take erratic mobile network service into consideration.

The Konga PWA dubbed Konga EZ allows customers to continue their shopping process all through to checkout even when they are out of network coverage. Aside from the fact that this allows us capture what was once considered lost revenue, it also provides us with the opportunity to provide a great shopping experience to our customers.

#### Features of Progressive Web Apps

Right out of the gate, Progressive Web Apps allows you to take advantage of technologies like:
- Push Notifications: push notifications makes it easy to re-engage with users by showing them relevant and contextual notification even when their browser is closed. As a customer, nothing could be more delightful than getting a push notification notifying me of a 40% discount on a particular merchandise or category&mdash;Fashion, Electronics, etc&mdash;of my choice.

- Add to Home Screen: Giving users the ability to add your app to their home screen. This allows your users to quickly and seamlessly launch your application and it saves them stress of typing long urls into an address bar.

- Instant loading: Service workers allows your app to load nearly instantly regardless of the network the user is currently on.

- Security: HTTPS ensures that information is transferred securely between you and your users. This solves the problem of man in the middle attacks.

- Native Hardware Access: Accelerometers, gyroscope and compass are some of the native app features that is made available via PWA. Nothing like a gentle vibration on a Friday afternoon reminding your users to buy spa deals for themselves and their love ones.

- Responsiveness: progressive web apps fits any form factor, this is really powerful if you consider the plater of devices available today.

<div class="center-block">
	<p>
		<img src="{{ site.url }}/assets/article_images/konga-pwa/offline.jpeg" style="width: 300px; height:auto;" class="center-block"/>
		<small>Offline browsing</small>
	</p>

	<p>
		<img src="{{ site.url }}/assets/article_images/konga-pwa/home.jpeg" style="width: 300px; height:auto;"/>
		<small>Home page</small>
	</p>

	<p>
		<img src="{{ site.url }}/assets/article_images/konga-pwa/category.jpeg" style="width: 300px; height:auto;"/>
		<small>Category Pages</small>
	</p>

	<p>
		<img src="{{ site.url }}/assets/article_images/konga-pwa/details.jpeg" style="width: 300px; height:auto;"/>
		<small>Product Details page</small>
	</p>
</div>

#### Africa and Progressive Web Apps.
While the price of mobile data has been dropping rather sharply in recent times, it's still relatively expensive for some people. It's my belief that, technologies like PWA will have a profound effect on the African continent and this will further drive the adoption of African owned web properties. 

Here is a video of our PWA presentation.
<iframe width="560" height="315" src="https://www.youtube.com/embed/GNbVdPi24gg" frameborder="0" allowfullscreen></iframe>
<br/><br/>