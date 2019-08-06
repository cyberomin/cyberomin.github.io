---
layout: post
title:  "Making sense of data: Pharmacy edition"
date:   2019-08-06 03:00:00
categories: startup
description: "A while ago, I wrote an article about SQL being a really strongly tool in today's business environment."
---

A while ago, I wrote an article about SQL being a really strong tool in today's business environment. In that article, I argued why ML was overkill for really simple business processes an how the implementation and or adoption of SQL can bring tremendous value to businesses. 

Most businesses, in my opinion, collect data and do nothing with it. While I am aware of data privacy laws and data exploitation, what I’m alluding to here is collecting data solely for the main purpose of efficient user experience and beneficial customer engagement. I’ll spend some time in the next few paragraphs and talk about how brick and mortar businesses can take advantage of their data, build brand loyalty and drive consumer engagement. 

My focus here will be on pharmacies. But the insights shared here can be applied to any other industry. I will use childbirth, infants and their early years as a case study. 

**Pregnancy**

When we were expecting our first child, I’ll go out almost every fortnight to get a pack of Vitabiotics’ Pregnacare. This was the prescribed supplement. I did this from the first trimester to the third and this began my long-running relationship with pharmacies. What surprised me most was the fact that the pharmacist never asked a question. It felt almost as though s(he) was more interested in handing me the supplements and sending me on my way. Not that I hold any grudges, but I think they missed an opportunity to become part and parcel of the entire pregnancy journey. And the opportunity to be part of something special. 

During a consulting session with a client, we used this pharmacy as a case study and talked about what we could have done differently. Here’s what we would have done differently. 

Aside from taking down my phone number to sign customers up for a loyalty program which the pharmacy did, I would have gone the extra mile to collect the customer's email. Given that this might be their first interaction with the store, I would have treated this as their onboarding process too. With the knowledge of the drug the just purchased, we can infer that this is an expectant parent and we will begin a relationship of being helpful. 
The first thing we will do is send them health tips and how self care tips during their pregnancy journey. This can be automated to come in once every month. These tips will come in the form of a newsletter with contents like; exercise for pregnant women, links to mobile apps that can help track their journey. For this to be effective, we would have collected two extra information; pregnancy stage and expected date of delivery(EDD).

**Infancy(0 - 6 months).**

With the EDD collected, it’s a lot easy to infer the child’s birth, while this is an opportunity to send a congratulatory message to the parent, I will advise against this as this is a slippery slope. For parents that had a successful delivery, this is super exciting, but for those that didn’t have one, this is a recipe that could trigger bad memories; think about the husband that lost his wife or the couple that lost their baby. Our honest advice will be to hold on and put a pause here.
Now let’s take the happy route. The route where the birth was successful and the parent is returning for a set of diapers or any baby care product. 

As first-time parents, one thing that we did every other month was buying prescription drugs and toiletries for our son. These drugs ranged from regular vitamins to ailments common amongst kids; teething, stomach upset, cold, etc. The routines that led to these regular visits were simple and predictable. The child temperature gets unusually high, we take him to the hospital, a few examinations here and there and we are handed a prescription. Standard. We have, for the most part, patronised ever big pharmacy chain in Lagos.
Every time I walk out of any of the store operated by the pharmacy, I worry that they don't know me or have any records about my purchase, except for the standard inventory that most businesses keep. So this got me thinking, what if this pharmacy knew a little about me? What will that look like? What possibilities can come out of this? 

A pharmacist or a pharmacy can almost accurately predict the age of a baby based on the drugs that the parents buy. And they can also predict the developmental stage of that child based on these purchases. Let’s take a simple scenario for instance, if I had walked into a store to buy a pack of Milton, there’s a high likelihood that I am buying this for a newborn. What if during that purchase, I added a pack of size 1 diapers, this also gives the pharmacy a good indication of what stage the child is. Wouldn’t it be natural, to say after 3 months the pharmacy recommends the size 2 pack for me, considering the baby would have outgrown the previous size. 

The scenario above is just one case. What if during the wet season, the pharmacy sends me a newsletter on how to handle my child during this period and also recommend drugs for common issues. This will be a lot more beneficial to me as the pharmacy acts like a trusted advisor while also maintaining good customer relationships and this further translates to repeated purchases. 

_Let’s get into the operations side of things_

Every parent today will buy diapers. Depending on the brand, some diaper boxes contains about 180 pieces  Assuming the baby uses 4 pieces per day, this will come down to 45 days. That means, every 40 days, the new parent will get an SMS/email reminder urging them to restock. Trust me, this will be super helpful.

A few days after the first interaction (assuming we skipped the *Pregnancy* phase), let’s call it onboarding, I will send the parent an email on “baby care tips” 1) Bathing tips and techniques. 2) Appropriate sleeping positions and patterns for a newborn. 3) Nutritional aid and guide, this is assuming the baby’s mum aren't lactating just yet. 4) Fabric care tips for babies. Then upsell with infant formula recommendation or any baby care products.

Towards the end of the 3rd month and also depending on the baby’s weight at birth, we will recommend the next diaper size via email and SMS. This could be something like `“SELECT * FROM table WHERE baby weight >= 3 AND age > 3”` where the first 3 is in KG and the next 3 in months.
Trust me, without proper guidance most new parents don’t know about this. 

**6 - 12 months**

As the baby grows towards the 6th month, we will send the appropriate formulae recommendations, follow that with diaper size and recommend common drugs for infant allergies. If we do our job very well, we will quickly become the parents trusted advisors and go-to store for any baby health and nutrition-related issues for these new parents.

During this phase, the “night cries” begins and it can be both frustrating and stressful. Providing tips on how new parents can cope with this phase can’t be overemphasized. They will thank for a long time.
Between month 7 - 9, most babies will begin to pull themselves up by holding onto pieces furnitures, it’s important for parents to be vigilant at all times. For most parents, recommending that they move out their LED TVs from the babies reach could be the difference between life and death. Also, recommending sanitisers as well for both visitors and the parents will go along way to help fight common ailments that could be a result of bacterial infection.

By month 9, most babies begin teething. This is almost always followed by stomach upset. This is our chance to recommend solutions like Grip Water and upsell them on that. We will also recommend pacifiers too as most babies do well with them.

Remember, we don’t have to recommend only SKUs that we stock. While we try to upsell and drive traffic, the grand plan is to build customer loyalty.

With all of the information we have about the family, we can start a monthly subscription service for new parents. It can be a combination of diapers, formulas, toiletries and common drugs + vitamins. It cost north of N50,000 for babies monthly supplies. Creating a value of box of say N45,000 will be God sent. The amazing thing here is that you will spend next to nothing promoting this as you already have an existing customer base. 

If you have a steady membership pool of 100 parents, that’s a N4.5M/month revenue stream. To even sweeten the deal, they can pay membership fee a lá Amazon Prime that gives them access to a paediatrician and a monthly physical meetup. New parents love to connect with other new parents.
The great thing about this is also the word of mouth advert that this will generate. Free publicity. New parents trust fellow new parents. Our focus will be to keep tracking the child’s age and milestones and be there for their parents every step of the way.

**First birthday and beyond**

When the child clocks one year, we will send a birthday hamper to further seal the relationship. This could be anything from gift cards, stuffed toys or a LEGO pack. Nothing gladdens the hearts of the parents like a small thank you gift. 

When it’s the holiday period, kids are home, running, jumping and tripping too. Put together a “one-time” deal for home first-aid boxes; plaster, spirits, cold medication and any other thing that can go into a first aid box.

Tap also into these parents online life; start a Facebook group, encourage them to join and provide them with an opportunity to meet fellow parents. Help them by providing information that will help them become better parents.

My oldest kid is 2.8yrs today. I don’t know what happens from age 3 and above. But I am certain the pharmacy I patronize would have been a lot more useful to me if they did any of this.