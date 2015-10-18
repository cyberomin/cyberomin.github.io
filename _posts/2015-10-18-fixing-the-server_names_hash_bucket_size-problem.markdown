---
layout: post
title:  "Fixing the server_names_hash_bucket_size problem in Nginx"
date:   2015-10-18 01:09:00
categories: tips, nginx
description: "Fixing the server_names_hash_bucket_size problem in Nginx"
---

Today I ran into an issue with Nginx. Nginx shuts down on me when I added a new virtual host.
Upon checking the error log, I this error:

```
could not build the server_names_hash, you should increase server_names_hash_bucket_size: 32
```

This means there was an issue with the nginx server name hashes.
The fix is quite simple. In the http directive in the nginx.conf file, locate `server_names_hash_bucket_size`, enable it and increase the hash to somehting like 128

```
http {
  server_names_hash_bucket_size 128;
}
```

When you have done this. Restart nginx `sudo service nginx restart` and you should be fine.