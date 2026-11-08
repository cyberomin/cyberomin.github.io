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

**Let's talk about collection:**
For collection, a typical user is always asked to leave a card on file, and card, in itself isn't fool proof. 

Here's a typical sequence. A user adds card at the point of checkout. The card is tokenized by a payment processor, the credit company stores the card's token on their side and use that to charge at the due dates during the loan's tenor. 

While this should work in theory, this flow comes with a bunch of its own problems
1. The borrower may decide not to fund that account again. We can see this in our everyday lives; people will typically ask loved ones not to send money to a particular account as that account isn't "working"
2. Card expiration. If the loan has a tenor of 6 months, if the card on file expires at month 3, there isn't much the lender can do here again. You have to pray and hope the borrower will not ignore your micro nudge to add a new card.
3. Blocked card. A user might just block a card or mark it as stolen. When this happens, there isn't much that the borrower can do. 

The issues above can be solved by Direct Debit. 

**So what exactly is a Direct Debit?**
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
The check will have 

**This is how I imagine we will fix this.**
A central repository where all Fintech companies and Deposit Money Banks(DMB) dump in their loan data. This will be realtime and nothing batched. 

A user goes to an institution to take a loan. The institution takes the user's identifier, in this case, their BVN, runs an eligibility check, if the check succeeds, and a loan is disbursed and that loan information is stored in a central repository and it's made available to other lenders instantaneously. 

As the user pays of their loan obligation, either manually or an automated process, the lender is obligated to update the loan's status until the tenor runs out. 

What's the incentive here? A unified repository for all interested parties where the major value proposition being minimal NPL (non-performing loans) for all parties with vested interest.  

**Borrowing history check**
To check a loan status of a user with the BVN `12345678`, a `GET` request is sent as follows
Loan status:
```BASH
curl -G "/v1/loans" \
  -H "Authorization: Bearer YOUR_API_TOKEN" \
  -d "bvn=12345678"
```

Response:
```JSON
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
		}
	]
}
```

The response above shows that this individual has two loans, one was paid off and the other went into default. This is the entire credit history of the user. 

If an institution wanted to narrow down into a single loan and see its details, they can make a request like this:
``` BASH
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
		}
	]
}
```

The `insititution_code` represents the institution that gave out the loan. The code structure will always be alphanumeric, an alphabet followed by 5 digit numbers, where `CB` will be for a commercial bank, `MFB` for a micro finance bank and `FT` would be for a Fintech. 

The loan `status` will be either be `on_going` that signifies that this loan is still running or `default` that signifies that the loan has exceeded its tenor without being paid off. 

The loan `state`  can be either `paid` to signify that the loan has been paid off and `not_paid` to signify that the loan hasn't been paid off. These two keys are necessary as a loan can have a `status` of `on_going` while it's been `paid` off. 

With the response above, the lender - new or not - can easily tell that this particular user has an existing loan with a commercial bank with its accompanying repayment history.

**Booking a loan**
When booking a loan, the lender sends a `POST` request as follows: 
```BASH
curl -X POST /v1/loan-status \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_TOKEN" \
  -d '{"bvn": "12345678", "principal": 100000, "rate": 3.5, "repayment_start_date": "2026-02-01", "currency": "NGN", "tenor": 3}'
```

The borrower's `bvn`, the loan's `principal`, rate `rate`, repayment start date `repayment_start_date`, loan `currency` and the loan `tenor`. The `repayment_start_date` is important, as most institution might offer moratorium to their customer based on a special arrangement. 

**Mechanics: how this will work**
This goes without saying that the above system will only be available to licensed institutions. Before a lender can access a user's lending history, they will need virtual token to spend. The tokens are earned every time a lender post a new lending information or update an existing lending information. 

Every new loan booked gives you 10 new tokens, every time a loan is updated, the lender earns 5 new tokens. So, a loan with a 3 months tenor will end up giving the lender 25 tokens. The lender spends 15 tokens every time they try to access a user's lending profile. 

If a lender is out of token, they can pay for these tokens with real money. For example, N100 gives them access to a thousand token. You get the idea.

**Policy**
For this to work, the government will have to be the major driver of this with buy-in from every single institution that intends to offer credit. 