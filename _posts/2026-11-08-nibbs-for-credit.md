---
layout: post
title:  "NIBSS, but for the credit industry"
date:   2026-11-08
categories: startups
description: "In an earlier post, I had wrote about my previous company; Klump. I talked about the painful challenges of building a credit based [business in a market like Nigeria]"
---
In an earlier post, I had wrote about my previous company; Klump. I talked about the painful challenges of building a credit based [business in a market like Nigeria](https://cyberomin.github.io/startups/2026/10/25/the-end-of-the-road-for-klump.html). 

In this post, I will talk about the challenges during the eligibility check and proffer what I consider as the possible solution for it. 

Credit companies in Nigeria face a number of problems; collection and accurate data for eligibility check being chief amongst these problems. As a lender, eligibilty checks aren't a once and done problem. They are recurrent. The very fact that a borrower was eligible a couple of months ago doesn't necessarily mean they will be eligible this time.

#### Let's talk about collection:

For collection, a typical user is always asked to leave a card on file, and card, in itself isn't fool proof. 

Here's a typical sequence. A user adds card at the point of checkout. The card is tokenized by a payment processor, the credit company stores the card's token on their side and use that to charge at the due dates during the loan's tenor. 

While this should work in theory, this flow comes with a bunch of its own problems
1. The borrower may decide not to fund that account again. We can see this in our everyday lives; people will typically ask loved ones not to send money to a particular account as that account isn't "working"
2. Card expiration. If the loan has a tenor of 6 months, if the card on file expires at month 3, there isn't much the lender can do here again. You have to pray and hope the borrower will not ignore your micro nudge to add a new card.
3. Blocked card. A user might just block a card or mark it as stolen. When this happens, there isn't much that the borrower can do. 

The issues above can be solved by Direct Debit. 

#### So what exactly is a Direct Debit?

A **direct debit** is an automated payment arrangement where a customer authorizes a business or organization to withdraw recurring fixed or variable amounts directly from their bank account. 

The user gives an organization an authorization mandate once at the loan booking process and that solves the collection problem.

The beautiful thing about Direct Debit is that the last 2 issues listed above are non-issues here. But the first issue on the list persist. To solve this, lenders will need access to GSI - Global Standing Instruction - a system that allows a lender to recover a loan and its accrued interest from any bank account(irrespective of where the account is domiciled) linked to the borrower's identity like, BVN. 

With GSI, the collection problem has been solved. 

Now, the elephant in the room will be credit check at the point of under-writting. During the underwritting process, a credit check will seek for a few signal:
1. Has this user ever gotten a loan?
	1. This is to solve for those new to credit
2. Does this user own a loan?
	1. Is this an active loan - a loan that has a valid tenor
	2. Is this a non-active loan - a loan that has gone into default
3. Does this user have an active loan?
	1. If the user has an active loan, is this user serving the loan? 

#### This is how I imagine we will fix this.

A central repository where all Fintech companies and Deposit Money Banks(DMB) dump in their loan data. This will be realtime and nothing batched. 

A user goes to an institution to take a loan. The institution takes the user's identifier, in this case, their BVN, runs an eligibility check, if the check succeeds, and a loan is disbursed and that loan information is stored in a central repository and it's made available to other lenders instantaneously. 

As the user pays of their loan obligation, either manually or an automated process, the lender is obligated to update the loan's status until the tenor runs out. 

What's the incentive here? A unified repository for all interested parties where the major value proposition being minimal NPL (non-performing loans) for all parties with vested interest.  

#### Borrowing history check
To check a loan status of a user with the BVN `12345678`, a `GET` request is sent as follows
Loan status:
```bash
curl -G "/v1/loans" \
  -H "Authorization: Bearer YOUR_API_TOKEN" \
  -d "bvn=12345678"
```

Response:
```json
{
 "fname": "John",
 "lname": "Doe",
 "date_of_birth": "1996-03-12",
 "loans": [
 {
  "id": "xyqabc",
  "principal": 100000,
  "interest": 15000,
  "rate": 4.5,
  "booked_date": "2026-01-01",
  "expected_closed_date": "2026-04-01",
  "state": "not_paid",
  "status": "default",
  "currency": "NGN",
  "institutuon_code": "CB00101"
 },
 {
  "id": "xyzabc",
  "principal": 100000,
  "interest": 15000,
  "rate": 4.5,
  "booked_date": "2026-01-01",
  "expected_closed_date": "2026-04-01",
  "state": "paid",
  "status": "closed",
  "currency": "NGN",
  "institutuon_code": "FT0101"
 }]
}
```

The response above shows that this individual has two loans, one was paid off and the other went into default. This is the entire credit history of the user. 

If an institution wanted to narrow down into a single loan and see its details, they can make a request like this:
``` bash
curl -G "/v1/loans/{id}/status" \
  -H "Authorization: Bearer YOUR_API_TOKEN" \
  -d "bvn=12345678"
```

With the request above, they get a single loan information response like the one below:
```json
{
 "principal": 100000,
 "interest": 15000,
 "rate": 3.5,
 "tenor": 3,
 "booked_date": "2026-01-01",
 "repayment_start_date": "2026-02-01",
 "currency": "NGN",
 "institution_code": "CB00101",
 "status": "on_going",
 "state": "paid",
 "bio_data": {
  "fname": "John",
  "lname": "Doe",
  "date_of_birth": "1996-03-12"
 },
 "repayments": [
  {
    "amount": 38333.33,
    "due_date": "2026-02-01",
    "state": "paid"
  },
  {
    "amount": 38333.33,
    "due_date": "2026-03-01",
    "state": "paid"
  },
  {
    "amount": 38333.33,
    "due_date": "2026-04-01",
    "state": "not_paid"
  }]
}
```

The `insititution_code` represents the institution that gave out the loan. The code structure will always be alphanumeric, an alphabet followed by 5 digit numbers, where `CB` will be for a commercial bank, `MFB` for a micro finance bank and `FT` would be for a Fintech. 

The loan `status` will be either be `on_going` that signifies that this loan is still running or `default` that signifies that the loan has exceeded its tenor without being paid off. 

The loan `state`  can be either `paid` to signify that the loan has been paid off and `not_paid` to signify that the loan hasn't been paid off. These two keys are necessary as a loan can have a `status` of `on_going` while it's been `paid` off. 

With the response above, the lender - new or not - can easily tell that this particular user has an existing loan with a commercial bank with its accompanying repayment history.

#### Booking a loan
When booking a loan, the lender sends a `POST` request as follows: 
```bash
curl -X POST /v1/loan-status \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_TOKEN" \
  -d '{"bvn": "12345678", "principal": 100000, "rate": 3.5, "repayment_start_date": "2026-02-01", "currency": "NGN", "tenor": 3}'
```

The borrower's `bvn`, the loan's `principal`, rate `rate`, repayment start date `repayment_start_date`, loan `currency` and the loan `tenor`. The `repayment_start_date` is important, as most institution might offer moratorium to their customer based on a special arrangement. 

#### Mechanics: how this will work
This goes without saying that the above system will only be available to licensed institutions. Before a lender can access a user's lending history, they will need virtual token to spend. The tokens are earned every time a lender post a new lending information or update an existing lending information. 

Every new loan booked gives you 10 new tokens, every time a loan is updated, the lender earns 5 new tokens. So, a loan with a 3 months tenor will end up giving the lender 25 tokens. The lender spends 15 tokens every time they try to access a user's lending profile. 

If a lender is out of token, they can pay for these tokens with real money. For example, N100 gives them access to a thousand token. You get the idea. This system becomes a win-win for every participant.

While the above system is a good starting point, I think we can take this a step further.

#### Calculating a borrower's credit score
Now, having a central repository where all lenders can see a borrower's lending history is great, but I think we can take this a step further.

What if, instead of every lender having to interpret a borrower's lending history independently, the system could calculate a credit score for that borrower?

Think about it. If a borrower has taken loans from three different institutions, the repository already has information about those loans, their repayment schedules, outstanding balances and repayment history. We should be able to use this information to derive a reasonably reliable picture of that borrower's creditworthiness.

The idea isn't particularly complicated. We need to agree on the signals that matter and how much weight each signal should carry.

For a start, I would use a scoring system that ranges from 300 to 850, where 850 represents the lowest estimated credit risk.

I'd break the calculation into five components:

**1. Repayment behaviour (40%)**

This is arguably the most important signal.

Does the borrower consistently repay their loans when due? Have they missed instalments? When they miss a payment, how long does it take them to make good on that obligation?

I would calculate this using the proportion of scheduled repayments made on or before their due dates, giving more importance to recent repayment behaviour.

A borrower who has consistently paid their loans over the last six months should have a better repayment score than someone whose recent repayment history is characterised by missed payments, even if they had a good repayment record three years ago.

**2. Delinquency and default history (25%)**

Missing a repayment isn't necessarily the same as defaulting on a loan.

A borrower who misses a repayment by five days shouldn't be treated the same way as someone who has failed to service a loan for six months.

I'd introduce a delinquency classification based on days past due (DPD).

For example:

| Days past due | Severity |
|---|---|
| 0 days | No delinquency |
| 1–30 days | Minor |
| 31–60 days | Moderate |
| 61–90 days | Serious |
| 91–120 days | Severe |
| Above 120 days | Critical |

The system should also consider whether the borrower eventually made good on the obligation. A historical delinquency that has been fully resolved shouldn't carry the same weight as an outstanding default.

**3. Existing debt exposure (15%)**

Someone can have an excellent repayment history and still be over-leveraged.

For example, imagine someone earning N500,000 monthly who already has loan repayments of N200,000 across two institutions.

If another institution gives this person a loan with a monthly repayment of N150,000, their total monthly debt obligation becomes N350,000.

That's 70% of their monthly income.

This is where the repository becomes particularly useful. Instead of a lender looking at only the loans it has issued, it can see the borrower's aggregate outstanding obligations across participating institutions.

I'd use a debt service ratio (DSR) to measure this:

**DSR = (Total Monthly Debt Obligations / Verified Monthly Income) × 100**

The higher the ratio, the more pressure the borrower is likely to experience when servicing additional debt.

**4. Credit history and consistency (10%)**

How long has this individual been participating in the credit ecosystem?

Someone who has maintained a consistent repayment record for five years provides more evidence of their credit behaviour than someone who has only taken their first loan three months ago.

I would consider the length of the observed credit history and the consistency of repayment over that period.

One important distinction here: someone who has never taken a loan shouldn't automatically be considered a bad borrower. They simply have no established credit history.

The system should distinguish between a borrower with no credit history and someone with a history of poor repayment.

**5. Recent credit activity (10%)**

How frequently is this borrower taking on new financial obligations?

For example, someone who has taken four loans from different institutions within the last 30 days might require additional scrutiny.

The system should look at the number of recently originated loans, the growth in outstanding balances and how these obligations compare with the borrower's repayment capacity.

This is particularly important because the central repository makes it possible to identify borrowing activities that an individual lender might otherwise not see.

**Putting the numbers together**

Each of these five components produces a score between 0 and 100.

I'd then combine them using the following formula:

**Credit Score = 300 + 5.5 × (0.40R + 0.25D + 0.15E + 0.10H + 0.10A)**

Where:

- R = Repayment behaviour score
- D = Delinquency/default score
- E = Existing debt exposure score
- H = Credit history score
- A = Recent credit activity score
- 5.5 = Multiplier to scale the score to a range of 300–850. It's gotten by dividing the range of the score (850 - 300 = 550) by the maximum possible weighted score (100).
- 300 = The minimum score in the range.

The weights are initial assumptions that would need to be tested against actual repayment data from participating institutions.

Let's use an example.

Imagine a borrower with the following profile:

| Component | Score | Weight |
|---|---:|---:|
| Repayment behaviour | 92 | 40% |
| Delinquency history | 85 | 25% |
| Debt exposure | 75 | 15% |
| Credit history | 60 | 10% |
| Recent credit activity | 80 | 10% |

The weighted score is 83.3.

Applying our formula:

**Credit Score = 300 + (5.5 × 83.3)**

**Credit Score = 758**

We can then classify borrowers into different risk categories:

| Credit score | Risk category |
|---|---|
| 800–850 | Very low risk |
| 740–799 | Low risk |
| 670–739 | Moderate risk |
| 580–669 | High risk |
| 300–579 | Very high risk |

These are proposed starting bands, not established regulatory thresholds. They would need to be validated against actual loan performance.

**What happens when someone has never taken a loan?**

This is an interesting one.

I don't think someone who has never borrowed should automatically receive a poor credit score. That would defeat the purpose of creating an inclusive credit ecosystem.

For borrowers with limited credit history, the system should return a provisional score with a confidence indicator.

For instance, a borrower might have a score of 720 but a low confidence rating because the system has only three months of repayment history.

Another borrower might have a score of 720 with a high confidence rating because the system has five years of verified repayment data.

These are not necessarily equivalent from an underwriting perspective.

I'd therefore return two things whenever a lender queries a borrower:

1. The borrower's credit score.
2. The confidence level of that score.

**The bigger picture**

I think this is where the real opportunity lies.

The repository shouldn't just tell a lender whether someone has an outstanding loan. It should provide a continuously updated picture of that individual's credit behaviour across the financial ecosystem.

A lender should be able to understand how much a borrower currently owes, how consistently they repay, whether their debt exposure is increasing and how they have performed across other institutions.

Of course, the scoring methodology would need to be tested against actual loan performance, and there would need to be mechanisms for correcting inaccurate records, protecting borrowers' information and explaining how scores are derived.

I'd start with a transparent, rules-based model and gradually improve it as more repayment data becomes available.

The interesting thing is that the more institutions participate, the more useful the repository becomes. And the more useful the repository becomes, the better the credit decisions institutions can make.

> We shouldn't just be building a place where lenders share loan information. We should be building an infrastructure that helps the entire financial ecosystem make better credit decisions.

**Policy**

For this to work, the government will have to be the major driver of this with buy-in from every single institution that intends to offer credit. 