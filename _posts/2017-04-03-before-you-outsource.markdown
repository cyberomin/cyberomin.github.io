---
layout: post
title:  "So you want to outsource your product engineering?"
date:   2017-04-03 10:00:00
categories: tech
description: "In the last couple of days, there have been many talks about developer brain drain and capital flight from the Nigerian tech ecosystem. I’m mostly going to focus on the latter. "
---
In the last couple of days, there have been many talks about developer brain drain and capital flight from the Nigerian tech ecosystem. I’m mostly going to focus on the latter. 

In the life of a new technology startup founder, a lot is happening; getting that MVP into the hands of users, investors meetings, optimising pitch deck, product managing and generally being the jack of all trade. Not a bad thing if you ask me, considering the founder is just starting out and doesn’t have the cash to splurge. 

One thing that worries me is the recurring theme of, "the average Nigerian engineer isn’t good enough, charges an arm and a leg and will never deliver on time. So, if you want something great, outsource it.” While I have absolutey no problem with this, I mean, I can’t tell you how best to spend your money, I’m worried that most startup founders are mostly concern about the end product and blindsided about what happens behind the scene. For the majority of the founders, as long as when you click that button a modal box shows up and an event is fired behind the scene, all is good. This shouldn’t be the case. 

This post isn’t my way of supporting outsourcing or not, like I earlier mentioned, the money is yours, go where you get the most value. I’ll try to highlight one major component founders should consider before outsourcing; the role and the need of a technical lead. 

Having those “expected” events—fire an email after a new user register—occur when a user interacts with your product isn’t good enough, the long-term plan of the code that powers this product should be something that concerns you. How do you solve this? Get a technical team lead for your outsourced project. 

From a very high level, it sounds counter intuitive to get a technical lead when you outsource, considering the fact that these developers and code shops should know what they are doing. Sadly the reverse is always the case. 

Most freelancers and code shops are just here to get it done at all cost. They sacrifice best practices, put little thought in the development process and user empathy isn't something they could be bothered about. They push out features and just move on to the next project. Quality, epsecially code quality isn’t something they worry about, this is partly not their fault. How do you explain to a client that you spent half your day setting up a continuous integration environment and you will be spending just as much time writing unit tests on product features. To most founders, this doesn’t make sense. But these things are super critical, especially when you think about these products from a long-term perspective. 

Getting a technical team lead isn’t a waste of resources and it’s a really valuable investment. This person, if they know their onion, will work to save you untold heartaches many months down the road. They will be most likely be responsible for the technical decision that happens in the life of the project. 

It’s the tech leads place to advise the startup founder on best practices. He or she drives the product engineering.

#### Why is this important?

One time I was helping a friend evaluate the code for his product. The company he had outsourced to claimed they had four engineers on this project when in actual reality they had just one person slaving away on the product API and the UI/UX component. It was easy to tell, all I needed to do was look at the git history/logs, it turns out only one person was making commit. And to make things interesting, all these commits happened on the master branch—no feature branching—which also explains why there was no pull request. I mean, how do you even PR(pull request) and code review yourself? Doesn’t make sense. You don’t set your own exams and grade yourself afterwards. The saddest part about this whole thing was that he paid for four engineers at $2,500 per pop. Not cheap. 

The company he had outsourced to, didn’t only make terrible technical decision, they just didn’t care. While going through the source code, I discovered they were saving passwords in PLAIN TEXT. Yes, plain text passwords in 2016. I almost had a heart attack when I saw this. I quickly flagged it and they came up with a nice excuse to back their decision. They used really old and outdated versions of frameworks, frameworks that had no LTS(long term support). This one had cascading consequences, essentially they will be missing out on bugs and security fixes not to even mention optimisation. 

This same company had no concept of a staging server. Everything went straight to production. No filter. I guess they just wanted to show progress and cared about only that. They also deployed a NodeJS application without a process manager or a reverse proxy.

The concept of using configuration management and deployment pipelines sounded alien to them. In essence, when they were ready to deploy, someone will manually SSH(secure shell) into the server and run a `git pull` and a new version was out in the wild. The problem with this method is many folds. a) rollbacks were difficult if not near impossible. b) If a server goes down at any point in time, someone had to manually create a fresh VM(virtual machine) and manually install all the packages needed to run the service. 3) if there was ever a sudden traffic spike, the system will collapse. They had everything in one machine; database, API and the UI, high availability was never in the plan. And yes, your guess is as good as mine, no one was replicating the database. If that node went down or data was lost, there is almost no way to recover and this might just be the end of my friend's startup. I can go on and on about things that didn't go well.

All of these discoveries were made after about a 30min conference call and spending another an hour on the project repository. As you can imagine, the code shop didn’t like me. I instantly became a torn on their flesh. That troublesome Nigerian. 

After these discoveries were made, I told my friend and the code shop about the changes they needed to make, the code shop instantly fired back that these changes will not only impact the project timeline, it will also cost an extra fee. Eventually, the relationship between my friend and the code shop went south and he is trying to rebuild his project; wasted time and resource. 

I cannot over-emphasize the need for a technical team lead, this person will make your life a lot easier and you will have a peaceful night rest. In my friend’s case, if he had hired a technical lead from the inception of the project, I am certain things would have gone a different route. 

Dear startup founder, don’t just worry about those nice features, think also about what goes on behind the scenes. A house with a nice paint work and construction practises will begin to show its flaws over time, especially when subjected to stress. 

Finally, get a technical team lead. Your will be glad you did.