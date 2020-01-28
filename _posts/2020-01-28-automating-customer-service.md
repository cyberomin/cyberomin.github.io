---
layout: post
title:  "Automating Customer Support - Scratching our own itch."
date:   2020-01-17 06:30:00
categories: tech
description: "As a company, it’s safe to say we live inside Slack"
---
As a company, it’s safe to say we live in Slack. It’s where we work, collaborate and pretty much keep an eye on everything that’s happening in the company. For instance, daily stand up happens inside Slack. We get all sorts of notifications for the different monitoring services we run inside Slack. Our project/product management tool sends a notification to Slack. Slack is our God view. So it made sense to bring in customer service to Slack. 

<img src="{{ site.url }}/assets/article_images/altalabs/form.png"/>

<span style="font-size: 11px">_Contact Us Form_</span>

Before now, all the forms on our website was connected to a form service called [Form Spree](https://formspree.io) and the service served us well. The only problem was that we rarely checked emails, and when we did, it was maybe twice a day; first thing in the morning and the last thing in the day. This method, while it worked, wasn’t effective as potential clients will have to wait an average of 6 to 12 hours to get a response from us. Not good enough. 

Last week, I thought to myself, we are a technology company and we have all of these resources &mdash; people, services and infrastructure &mdash; at our disposal, why not fix this problem? So I tapped a colleague and we both got to work. The idea was simple, in addition to receiving emails(which we check sporadically) when people fill out our contact us form, why not send the form messages to Slack? Nothing groundbreaking here, but it was a fun experiment to try out.

My colleague(Temitope) started the project and I took over from him. We cloned our base API repository(yes, this is a thing here) and rolled out a single endpoint called `/messages.` This endpoint receives a simple payload that contains the sender's name, email, phone, organisation and message. Then post the content to a Redid-based queue running on one of our instances. From the queue, an email worker picks the message and fires off an email via Sendgrid to an email group; _**engineering@altalabs.io**_, followed by a slack worker. The Slack worker posts the messages to a Slack channel called _**#inbound-request**_. 

<img src="{{ site.url }}/assets/article_images/altalabs/email.png"/>

<span style="font-size: 11px">_Email_</span>

<img src="{{ site.url }}/assets/article_images/altalabs/slack.png"/>

<span style="font-size: 11px">_Slack_</span>

**The Future.**

When we get these emails, we typically reach back to the client with a Google form that asks them to describe their needs more elaborately. Today, while the bot post only to Slack, we will build a custom form just like the contact us form on the website and make the bot post the project need to our Trello-powered in-house CRM &mdash; we rigged together a CRM using Trello and a Trello Power-Up called Custom Fields. The board has 4 columns; Inquiry, In Conversation, Executing, Closed(for when we wrap up the project) &mdash; The same Google form content will also be sent to Slack for faster feedback and client engagement. 

<img src="{{ site.url }}/assets/article_images/altalabs/trello.png"/>

<span style="font-size: 11px">_CRM_</span>

<img src="{{ site.url }}/assets/article_images/altalabs/crm.png"/>

<span style="font-size: 11px">_CRM_</span>


In the future, this tiny bot that we have built will help us file tickets, customer service ratings(NPS), product reviews, and much more. I am super excited about this. What started off as an experiment to scratch out own itch is morphing into a tiny little project. Who knows, in future, we might turn this into a SaaS product. Only time will tell. 