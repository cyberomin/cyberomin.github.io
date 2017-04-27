---
layout: post
title:  "A pull request is submitted, what next?"
date:   2017-04-27 12:43:00
categories: engineering
description: "A few weeks ago, I wrote an article on the need to hire a tech lead when you consider outsourcing your engineering. This article sparked some interesting conversation and one was about pull requests(PR) and code reviews(CR) and how it should be approached"
---
A few weeks ago, I wrote an article on the need to hire a tech lead when you consider [outsourcing your engineering](http://cyberomin.github.io/tech/2017/04/03/before-you-outsource.html). This article sparked some interesting conversation and one was about pull requests(PR) and code reviews(CR) and how it should be approached. Today, I will try to talk about code reviews and some of its inherent problems amongst team members, and I’ll also highlight possible ways to overcome some of these problems. 

For context, I’ll love to explain what pull request and code reviews are and for the sake of this article, I’ll be using both terms interchangeably.

> A pull request(PR) is a method of submitting contributions to a software development project. It is often the preferred way of submitting contributions to a project using a distributed version control system (DVCS) such as Git. A pull request occurs when a developer asks for changes committed to an external repository to be considered for inclusion in a project’s main repository. Source - [OSS Watch](http://oss-watch.ac.uk/resources/pullrequest)

> Code review is a systematic examination (sometimes referred to as peer review) of computer source code. It is intended to find mistakes overlooked in the initial development phase, improving the overall quality of software. Source - [Wikipedia](https://en.wikipedia.org/wiki/Code_review)

The problem that I see with most pull request/code review session is when reviewers nitpick on seemingly inconsequential issues and often neglecting the elephant in the room. This does not only degrade the entire reviewing experience, it leads to unnecessary bike shading. This, in my opinion, is one of the few causes of strife within technical teams and it’s unhealthy. 

> The bike shed story tells of a management committee’s decision to approve a nuclear power plant, which it does so with little argument or deliberation.  The story contrasts this with another decision on choosing the color of the bike shed where the management gets into a nit-picking debate and expends far more time and energy than on the nuclear power plant decision.

A pull request should be a learning experience, it’s an opportunity to get good feedback from trusted team members. This feedback could range anywhere from writing more structured and succinct code to better optimisation of algorithms, queries, etc. It’s the time to be open minded and not become unnecessarily defensive. 

One issue that I find quite worrying is the fact that most authors come with girded loins when the submit their PRs. You can’t tell them otherwise, after all, they have spent a significant portion of their day solving this complex problem and all they need is your approval and a merge to the base branch. And this is a big problem.

But, as an author of a PR, before you put on your armour, take a second and think through the opinions of your reviewers, and look at the issue from their own lens. Your reviewers are here to uncover your blind spot, they check those things that must have slipped through the cracks, they are meant to guide and help you become better. When authors approach their PR/CR session with the way they would approach an editor, they become aware of things they must have overlooked, uncover new paradigms and fundamentally gain new knowledge. Your reviewers, like editors, are your third eyes. 

Are your reviewers always right? Far from it. Your reviewers, like every human, aren’t infallible. They will make mistakes, and it's your place as the author to help guide them to the obvious and help them understand your thought process to the problem and what led to your solution. One of the problems I have seen with PR sessions is when reviewers are in haste to prove a point without first, understanding the problem domain. They make hasty conclusions and in most cases, miss the main point by a stretch. 

As a reviewer, your first task is to understand the problem domain and offer suggestions as opposed to calling people out. This is one of the reasons most authors become defensive. Don't do that, you don't want to be that guy. While reviewing, If it helps and where possible, move over to the author's desk or get on a call and share screen, then you can ask questions as to why the author made some design choice. This does not only reduce any unforeseen tension, it allows you to understand the problem and solution a lot better, see things from author's perspective thereby giving you an opportunity to give constructive feedback. The other advantage to this approach is that it create's the sort of bond that will make people more receptive to your ideas. 

Authors become defensive when comments left on their PRs make them look stupid. There’s an ego in every human, never forget that. A code review session is a win-win for everyone. The reviewer(s) and author both learn and benefit from the experience. Put extra thought and care into crafting your feedback, they should be suggestive and also offer a better way of solving a problem.  

Remember, when a code review session degenerates into a pissing contest, its essence is lost and everybody, both the reviewer(s) and the author loses out big time. 