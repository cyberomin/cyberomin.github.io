---
layout: post
title:  "The Konga Engineering Tech Stack"
date:   2016-07-26 02:30:00
categories: engineering
description: "Konga isn’t necessarily an e-commerce company, we’re a technology company that builds tools to facilitates trade and commerce. This explains why our mission is To be the Engine of Commerce and Trade in Africa."
---

Konga isn’t necessarily an e-commerce company, we’re a technology company that builds tools to facilitates trade and commerce. This explains why our mission is *"To be the Engine of Commerce and Trade in Africa."*

I’ve been asked a couple of times if we are a technology enabled business, short answer: we are not. While we started out as an e-commerce retail company, we have since evolved into a platform. Calling Konga an commerce company is like saying Uber is a Taxi company or AirBnB is a hotel chain. I digress.

Over the years, we have invested a considerable amount of resources in building solutions like SellerHQ (marketplace), KongaPay(Payments), Mercury(logistics software powering KOS Deliveries), Community(a forum where buyers and sellers can come together and share ideas.), etc.

> Mission: To be the Engine of Commerce and Trade in Africa

For a long time, I have been meaning to do this — write about the technology and stack that we use at Konga —  but today, I am actually going to take a stab at it. In this post, I will try and explore our stack and the technologies we rely on daily. I will do my best to cover both the front facing properties and the things under the hood.

### Backend.
Our most visible property is the Konga.com website(catalogue), for a lot of people, this is their first point of call when trying to interface with Konga. The website essentially holds inventories from our merchants.

The catalogue is powered by a catalog service — we’re favouring microservices these days — and this service is largely composed of Elasticsearch. We index data into our Elasticsearch cluster from a large MySQL machine from our legacy system. The choice of using Elasticsearch was a no brainer as it offers a lot of benefit out of the box. Its highly available, multitenancy, full-text search engine coupled with its schema-free data structure makes it an ideal candidate for a catalogue service.

Elasticsearch allows us build faceting into our catalogue(UI) with ease, this is made possible by Elasticsearch’s awesome aggregation feature. Aside from faceting, Elasticsearch gives us the power to build autocomplete functionality for search queries and also do other interesting things like term/word suggestions — “did you mean” — when a user enter’s a wrongly spelt word. This really improves the overall user experience.

### Logging and Monitoring
Logging is at the core of every service that we build at Konga, they give us a window into what’s happening at every point in time. Data is collected and indexed at near realtime into an ELK(Elasticsearch Kibana Logstash) stack for future search and analysis.

NewRelic is the resident guardian angel to all our servers. We really on it heavily for health checks and application level introspection; slow queries, long running processes, etc.  We rely on Splunk’s MINT(Mobile Intelligence) for our mobile apps monitoring; crash report, analytics, performance, etc. It gives us a high level overview into our operational intelligence.

### Deployment
Deployment and configuration management is done using Chef via AWS’s OpsWorks. We write our custom recipes and manage them using version control — git. Chef is a battle tested in infrastructure automation tool.

Most of our production system runs Linux(Ubuntu.) and Microsoft’s Windows Server.

### Metrics
A colleague once said, "If is’t running, measure it.” This is a mantra that we have come to embrace and love. Every single endpoint of every live service is tracked and measure.

They are many reasons why collecting stats about servers and an applications is a good idea. Not only does it help with regards to scaling, it also allows you to figure out pain points and possible blockers while troubleshooting.

We collect all our metrics through StatsD via UPD and store them in a time-series database system, our time-series DB of choice is InfluxDB and we use Grafana for our visualisation. I can’t overemphasise the need to collect metrics and how much these metrics have saved the day for us. We measure everything.

### Development
We use Docker containers for our local app development. Before now, a lot of the services relied on Vagrant. Virtualising our development environment has tremendous benefits;

-  On-boarding new engineers becomes a lot easier as this dramatically reduces local environment setup from 2 days to 2 hours.
-  Consistency across different environment is maintained. We have totally eliminated the “it works on my machine” problem.
-  It more time is spent doing meaningful work and less *bikeshedding*.

We utilise git heavily and it’s our goto choice when it comes to version control. We run our own in-house remote git servers using Atlasssian’s Bitbucket server. We have gone through hosted GitHub and Bitbucket, but Bitbucket server seems to be our best shot and we’re loving it. We also run our own in-house NPM registry for some of our private modules.

For IDEs, engineers basically use what works for them. We have people using everything from Vim, to JetBrains’ awesome IDEs - PHPStorm, WebStom and InteliJ. Atom and Sublime Text seems to have a strong following too and a handful of engineers are die-hard Komodo fans.

### Languages
PHP sits at the core of most of our system, interestingly, we started off as a RoR(Ruby on Rails) shop and gradually worked our way to PHP. With our move towards an SOA(Service Oriented Architecture) paradigm, we have been utilising NodeJS heavily.

Aside NodeJS and PHP, we have a few system running Python and C#. Java, ObjectiveC and Swift are the other sets of languages in our tool chain. Without them, our mobile apps(Android and iOS) probably wouldn’t have existed.

While we love these sets of languages, we almost never write them in their vanilla form. We always work with frameworks. These frameworks are; Phalcon, Yii and Laravel for PHP, ExpressJS, Restify for Node, and Flask for Python.

### Datastore
We love MariaDB and it just works for us. MariaDB is the primary datastore for all our structured data. Everything from the marketplace, community and other internal systems runs on it. We store a good chunk of our unstructured data in Elasticsearch; logs, products information and attributes and audits.

Redis is one tool that we love and it has served us quite well. We manage our caching and store session data in it. Before now, we also used Redis for task queues, but in recent times, we have migrated a lot of those to RabbitMQ. In the past, we’ve used Amazon’s SQS but we’re really happy with RabbitMQ.

### Testing and builds
We write the bulk of our test using a combination of different tools; PHPUnit, Mocha, Chai and Sinon and we use Atlasssian’s Bamboo as our build server. Fail builds are reported directly into a Slack channel.

### Documentation and Project management
At this point, it’s obvious that we’re a big fan of Atlasssian, I guess this is partly due to the fact that they make tightly integrated products that does what they were supposed to do. This probably explains why we use Confluence as our Wiki and JIRA for project management.

### Technologies
Some of the other piece of technologies that make up our stack include Nginx for reverse proxy and serving of static content. We run PM2 as our process manager of choice for all our NodeJS applications.

We store static contents on Amazon’s S3 as well as our backups. Amazon’s S3 just works. For some systems, we use AngularJS for the frontend and style with LESS and use grunt as our task runner. We also use Bower as our package manager for the web.

Handlebars is used as the templating engine for a couple of our projects, but in recent times, the frontend team have found favour in the sight of Dust.

For our transactional emails, we rely solely on Amazon’s SES. We used to use Mandril(I really did love the service), but SES serves us just well. Every transactional SMS is powered by RouteSMS.

Our recommendation engined was powered by RichRelevance, but we have since retired that in favour of a custom solution built with PredictionIO.

Load balancing is down with Amazon’s ELB. And we use Edgecast for our [ADN](https://en.wikipedia.org/wiki/Application_delivery_network)