---
layout: post
title:  "Konga: The Emergence of an African Technology Powerhouse"
date:   2016-01-07 01:54:00
categories: startup
description: "When you are getting into a new market, an emerging market in particular, you do everything to get in fast and worry less about your technology stack. The reasoning behind this is simple; you have to find market acceptability before you even spend time getting shiny new technology into your stack."

---

When you are getting into a new market, an emerging market in particular, you do everything to get in fast and worry less about your technology stack. The reasoning behind this is simple; you have to find market acceptability before you even spend time getting shiny new technology into your stack. [Timing is everything](http://cyberomin.github.io/startup/2015/10/06/priority.html)

When Konga formally launched on July 10, 2012, we were laser focused on the mission &mdash; to become the engine of commerce in Africa &mdash; and worry less about what is powering the machines. We started off with an open source solution called [Spree](http://spreecommerce.com). It was important for us to get into the market fast and it made sense to use an existing open source solution. We turned to spree and it serve us well.

For 2 years, the entire website of Konga.com was powered by Spree and boy, we pushed that software to its limits, so much so that we were used as a case study &mdash; [Evaluating Rails e-commerce platform](https://spreecommerce.com/pdfs/vinsol_case_guide.pdf). 

We customised Spree beyond what it was made to do. For starters, we extended its core to support a new payment method called PoD(Payments on Delivery) as this is a huge deal in emerging markets: Nigeria, India, China. We also built multi-vendor support into it. This particular feature powered our first Marketplace. We added  other features like delivery time slots, drop shipping, etc.

While Spree did most of what we needed as a company, we quickly outgrew it. This singular reason gave rise for a move to another system. A system that is battle-tested, tried-and-trusted. One used by major retailers around the world and with a large community support and resources. After evaluating a couple of solution, including Hybris, an enterprise e-commerce solution that powers the likes of Target and Fresh Direct, we settled for Magento Enterprise. The decision was simple; the bulk of what we were building into Spree already existed in Magento out of the box. <em>Why reinvent the wheel?</em>

Konga has been running on Magento since November 2013 and it still powers a section of the website. But like with every other thing, Konga’s growth is fast getting out of Magento’s league and the software is beginning to creak under its own weight.

There is a time for everything.

In August of 2015, the engineering team made a decision to move away from Magento &mdash; Magento is a monolith &mdash; and instead embrace the concept of microservices. We broke down the monolith into tiny services: catalogue, search, reminder, notification, cart, ratings and referral services. And we have never looked back.

There's something unnerving about going into an unfamiliar terrain, but we pride ourselves in the fact that we consistently push the envelope and challenge the status quo. The concept of microservices is new to us all, nonetheless, we will go that route. While we are not the pioneers of this new paradigm, we will draw inspiration and stand on the shoulders of industry giants like Netflix, Amazon, Twitter. We will stumble, this is expected but we will rise.

So far, we have been able to push six services in production. Notification, catalogue, ratings, search, reminder, referral are all currently running and we will continue to build more services and swap out parts of the monolith that are not needed. This is a huge task.

While public facing website, [Konga.com](http://konga.com) is the most prominent asset of the company, the company has been building a lot of internal tools to solve her own problems. Last year April, we started a rather audacious project. One, that from the onset sounded impossible and had a larger than life outlook. The mandate was simple; build a new CRM that will replace Salesforce. Wow! What was more interesting was the fact that we had three months to complete the project. This isn’t the first time we will be undertaking near impossible tasks with a really tight deadline. We once embarked on a project to replace another third party e-commerce marketplace solution with our homegrown software, [SellerHQ](http://shq.konga.com).

###A little bit of background.
We had been running Salesforce for about a year and it served us well, but as a young and dynamic company with ever changing requirements, we had unique needs that Salesforce didn’t quite cater for; lifetime value of a customer, last five orders, wallet balances, merchant products, etc., with these unique needs coupled with the licencing that came with Salesforce, we decided to roll out our own solution. Bear in mind that we were going up against an 18-year-old company.

###Enter ZIN.
ZIN is our in-house CRM solution that eventually replaced Salesforce. It’s by no means a true Salesforce replacement, but it scratches our itch. And most importantly, it saves us money from licensing fees. ZIN is an effort that spanned past the allocated three months project duration, it actually took us almost five months to roll it out; from requirements analysis to product launch.

<img src="{{ site.url }}/assets/article_images/power-house/zin.png"/>
<em style="color:#CCCCCC;">ZIN</em>

ZIN offers a simple and intuitive way to manage customers and everything customer related. At first glance, it shows you the priority of cases based on its urgency and every priority has a unique colour code. It offers the convenience of creating cases via, email, and social media; Facebook and Twitter.

ZIN gives you a 360-degree view of a customer's lifecycle, from wallet transactions, order history, complaints to enquiries. It goes a step further to classify customers into different segments: Bronze, Gold and Premium.

ZIN allows us to monitor our social media feeds right without the need of a third party software. This particular feature has proven invaluable as the vast majority of customer’s interactions are done via social media.

The success of ZIN has proven to us that we are coming of age, and we can successfully wean ourselves from external tools and craft one for ourselves. One that touches where it pinches most.

<center>-------------------------------</center>

More than anything, we are excited about the road ahead and the progress this baby, Konga, has made. A little over 3.5 years ago, we started life running on open source solutions, 3.5 years later, we are charging into a new terrain, building our own tools from the ground up to solve our unique problems. 

We are building a truly and unique African technology company. One that, dare I say will chart the course for other companies and serve as a source of inspiration for other African companies to come. 

We are excited about the lessons learnt thus far and we will do our very best to share our experiences with the wider community and hope that someone out there will learn and benefit from it.