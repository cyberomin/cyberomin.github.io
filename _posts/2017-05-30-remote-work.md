---
layout: post
title:  "Remote work: How we make it work"
date:   2017-05-30 04:30:00
categories: work
description: "Working and leading a remote team can be daunting without the right tools and processes in place. Getting the right tools very early on will save you loads of trouble and your productivity will shoot through the roof."
---
In the last couple of years, there has been a strong advocacy for remote work and how it a)improve employees productivity and b)is fast becoming the future of work. Technology companies, especially startups add remote work as one of their benefits. 

But things aren't always rosy in the remote land. one of the problems that I have seen one too many times is that of communication and visibility and the antidote to this is over communication. Voice out every move. The physical office provides some benefit that is almost non-existent when you work remotely, for one, the in-person communication cannot be overemphasised.

Working from the same physical location and actually seeing the people you work with has a huge upside. This benefit becomes apparent when communicating with one another, things like voice tone and body language add fine-grained nuances that technology can't bridge. 

<center>____________</center> 

Working and leading a remote team can be daunting without the right tools and processes in place. Getting the right tools very early on will save the team loads of trouble and also improve productivity. I mean, you can only do your best work when you have the right tools. In this article, I'll try to highlight some of the tools that my team uses daily and why we use them.
 
**Slack:** Slack is where the magic happens. I think about this tool like our command centre. It’s pretty much where we start and end our day. With the help of amazing bots and integrations, the possibilities with Slack are endless.  We use Slack for our daily stand-ups, file sharing, voice calls and more. I personally use Slack as a personal assistant of some sort; I set reminders for things I am supposed to get back to at specific time using Slack reminders. Slack's slash command provides a rich suite of operations that can be performed right from the app. 
 
Beyond just the daily communication, we apply Slack to our team’s internal adaptation of ChatOps; a transparent workflow with a high focus on visibility. Take for instance, when a ticket is created or moved on our JIRA project board, a notification is sent to Slack our *#developers* Slack channel, that way, everyone on the team knows what’s happening at every point in time and who is working or responsible for what. When a comment is added to a GitHub pull request, Slack notifies a channel with the comment and the relevant parties can either continue the conversation using Slack or move it to GitHub.
 
> What is ChatOps? Conversations, put to work. ChatOps is a collaboration model that connects people, tools, process, and automation into a transparent workflow. This flow connects the work needed, the work happening, and the work done in a persistent location staffed by the people, bots, and related tools. [Source: Atlassian](https://www.atlassian.com/blog/software-teams/what-is-chatops-adoption-guide) 

We are big believers in the agile methodology, as such, we take things like continuous integration and deployment pretty seriously. Spring planning, retrospective and stand-up all happen on Slack. 

**CircleCI:** CircleCI is an invaluable and almost indispensable tool. For us, it isn’t just another CI tool, it’s our source of truth. CircleCI plays a critical role in our development cycle and deployment pipeline. It helps with running our test suites and does an auto deployment. The beautiful thing about this tool is how it integrates nicely with our workflow and other tools. For instance, when a build is broken, not only does CircleCI emails the entire team, it also sends a Slack notification to the team. And since we use almost the same Slack handle on our GitHub profile, the *build offender* &mdash;a person who breaks a build...I made this up&mdash; is notified immediately, this helps improve our turn around time and it also encourages transparency and accountability. 

CirleCI further allows us to enforce some defined standards like a coding style, it lint's all of our code and this process helps keeps our code base clean and promote consistency. 

<img src="{{ site.url }}/assets/article_images/slack/circleci-slack.png"/>
_CircleCI/Slack integration. Photo credit - Igor Davydenko_

**JIRA and GitHub:** are other tools that we use extensively. We use feature branching in our workflow, which means every JIRA ticket is a branch. The integration between JIRA and GitHub allows us to go straight from a JIRA ticket to a GitHub branch, and since we have a *PULL_REQUEST_TEMPLATE* that requires us to include the JIRA ticket ID, we can easily go back to JIRA from GitHub. 

When a branch is pushed into GitHub, JIRA links it automatically to its assigned ticket. 

<img src="{{ site.url }}/assets/article_images/slack/jira.png"/>

_A JIRA ticket, showing the associated GitHub branch, number of commits and pull request status_

**Screen Hero:** Once in a while, people need help with technical issues and this is absolutely normal. When a team member is blocked and needs help with an issue, someone who is free or a team member with the most experience and knowledge of the problem jumps on Scree Hero and pair. One of the benefits of this is that stronger bonds and connections are formed.

#### How did we get here?
In the beginning, things weren’t always like this, it took a bit of trial and error to find the best workflow. We started out using Slack for just communication but quickly found out that a lot of people didn’t quite know what was happening at every point in time. So, instead of asking “what are you working on?” every so often, we leverage our tools and let them do the talking for us. That way, we can minimise user interruption and just focus on getting work done. 
 
As a distributed team, we use these tools to compensate for our lack of in-person interaction. It could be a little annoying, and quite frankly, frustrating, having to go check on what task a person is working on at any point in time and also check the ticket status. We delegate this to Slack and Slack does the informing when a ticket status is changed. If a ticket moves from _In Progress_ to _Code Review_, the author doesn’t need to manually inform the team to review their work, Slack handles this and a few extra keystrokes are saved. Everyone is happy :)
 
#### Improvements?
We are not where I will want us to be, but honestly, I don’t think we'll ever get there. It will be a case of constant improvement. In the future, I would love to see us trigger manual deployment via Slack and get performance metrics via Slack too. We will likely experiment with tools like Hubot to see if they work for our team.
 
In addition, we’ll also explore custom integrations to leverage the APIs of the third party tools that we use. We will explore building an integration to AWS for instance, such that if there is a service degradation from a region that we work with, Slack can notify us in near real-time. This same tool can also be extended to include GitHub status notification etc. With this in place, we will be more proactive than reactive to issues. 