---
layout: post
title:  "Hermes: Notification as a Service. Sending millions of notifications monthly"
date:   2016-03-01 08:12:00
categories: engineering
description: "At Konga, notification is at the heart of every client facing product and most internal products that we build. This affords an easy way to keep in touch with our customers, keep them in the know of what is happening to their orders and for the merchants, let them know what is happening in their store"

---
At Konga, notification is at the heart of every client facing product and most internal products that we build. This affords an easy way to keep in touch with our customers, keep them in the know of what is happening to their orders and for the merchants, let them know what is happening in their store. We seldom send out push notifications for our mobile apps — Android and iOS — but, SMS and emails form the core of our notifications.

As our engineering team grew and different teams had the need to add notifications for their different products, we had the problem that most engineering team faces; everyone implementing things differently.

This route presents a problem, inconsistent coding style and no client library, most of all, keeping track of what was happening and ownership of the third party services we ride on became an issue.

###Enter Hermes
Hermes is our in house notification service -- Notification as a service, NaaS. It provides a simple RESTFul API for sending notifications; emails and SMS.

The major benefit of Hermes is that it abstracts the underlying API of  SMS and transactional email providers into one simple and consistent RESTFul endpoint — `/v1/notifications`  — that does one thing and one thing well; send notifications.

Hermes accepts sample payload in this format
```
{
    "medium": "email",
    "name": “app_template_name",
    "recipient": “you@example.com",
    "subject": “Your order has been shipped",
    "sender": "noreply@konga.com",
    "sender_id": “Konga",
    "params": {
        “customer_name": “James Bond”,
        “order_number”: “R123456789"
    }
}
```
The above payload is simple and almost self-explanatory. Below is a brief explanation of what each key means:
`medium` - The notification medium: `sms` or `email`
`name`  - The name of a template. Since we send different notification depending on an action, grouping these actions into templates makes a lot of sense. Template names are typically synonymous with actions: shipped_order, order_received, etc.
`recipient` the recipient of the notification.
`subject` - Subject of the email. Not required for SMS.
`sender` - Sender’s email
`sender_id` - Name of the sender
`params` - Holds nested JSON that the templates render into real content. Every template has a variable that gets replaced with a key in `params`
`customer_name` - Name of a customer
`order_number` - Order number

While every key in the above payload is mandatory, the keys that form the `params` varies based on the template content. A template is an HTML document with Jinja2 template syntax
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    Dear {{customer_name}}<br/>
    Your order with number: {{order_number}} has been shipped.
</body>
</html>
```
The above payload plus the template will translate to an email like this:

Dear James Bond,

Your order with number: R123456789 has been shipped.

###Hermes Technology Stack
Hermes is built with the Python Flask framework and it Jinja2 for templating. It uses RabbitMQ for messaging queue, MySQL as its primary data store, Redis for caching and Celery for distributed task queue.

We have been running Hermes for about 2-years now and it handles millions of notifications monthly.
