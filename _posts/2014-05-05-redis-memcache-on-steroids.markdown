---
layout: post
title:  "Redis - Memcache on Steroids!"
date:   2014-05-05 22:56:14
categories: redis scaling
---
Redis - Redis is an open source, BSD licensed, advanced key-value store. Simple. I wouldn't bother you too much.
Think about it as Memcached on steroids. Redis is 'insanely fast.' - RAM is cheap these days.

<p>I've heard so many good things about this awesome systems, untill last two weeks I haven't done anything with it.
I was recently assigned the task of adding a caching layer to one of our internal tools and my boss specifically asked
I use Redis. I smiled at myself - alas, I'll play with Redis in production.</p>

<p>Like I said earlier, Redis is a Key-Value store. Let's get our hands dirty.</p>

<p>Setting and retrieving a value is straight forward.
<pre>
SET foo bar
GET foo 
<em>bar</em>
</pre>
</p>
It doesn't get any simpler

If you need to delete this data, simply pass the key as an argument to DEL

<pre>DEL foo.</pre>

Redis has tons of commands. You can find all of them here - <a href='http://redis.com/commands'>http://redis.com/commands</a>

<p>Since the bulk of the data I was going to be storing were timestamp bound it was important I work with a command
that support ranges and a sorted set was the best option. There are tons of sorted set commands but <code>ZRANGEBYSCORE</code> was a perfect fit.</p>

Task 1. Store users based on the date the registered on the site.

<pre>
ZADD <key> <date> <email>
Retrieving is simple:

ZRANGEBYSCORE <key> <min date> <max date>
<key> - A key that uniquely identified this operation. Think of the key as a table in a RDBMS
<min date> - Start date
<max date> - End date
</pre>

<p>
Live example:
<pre>
ZADD users 20131001 Celestine:Omin:smartone@example.com
ZADD users 20131002 Mark:Cuban:smarttwo@example.com
ZRANGEBYSCORE users 20131001 20131002
<em>[Celestine:Omin:smartone@example.com, Mark:Cuban:smarttwo@example.com]</em>
</pre>
</p>

If I needed every single item in this without considering the date range, I could use

<pre>ZRANGEBYSCORE users -inf +inf</pre>
Where -inf and +inf are min and max respectively.
<br><br>
<em>P/S <code>ZRANGEBYSCORE</code> has a time complexity of O(log(N)+M) with N being the number of elements in the sorted set and M the number of elements being returned. If M is constant (e.g. always asking for the first 10 elements with LIMIT), you can consider it O(log(N)).</em>

Thank you.
