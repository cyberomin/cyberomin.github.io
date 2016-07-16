---
layout: post
title:  "Docker and PHP, what to look out for."
date:   2016-07-16 04:32:00
categories: engineering
description: "Two days ago, I had to switch projects at work and go work on a different project. As with a new project, setting up the project on my dev machine was the first thing I needed to do."
---

Two days ago, I had to switch projects at work and go work on a different project. As with a new project, setting up the project on my dev machine was the first thing I needed to do. I decided to setup the project with Docker for obvious reasons, on-boarding future engineers unto the project will be a breeze.

While setting up the project, I realised that Docker —env and PHP-FPM don’t quite mix properly. While passing in an environment variable file when running the containers will work, getting those environment variables with `getenv` from PHP will become an issue. The solution to this is to add the environment variables into the config file of PHP-FPM located at `etc/php5/fpm/pool.d/www.conf`.

Environment variables in the PHP-FPM config file follow a regular pattern, every variable begins with the word `env` followed by brackets for the actual variable name and a value e.g. `env[DB_HOST] = 127.0.0.1`.
Another thing you want to watch out for when setting up variables and values are the use of reserve words and special characters. Words like `yes`,`null`, etc shouldn’t be used in variables and also special characters like `!` should be avoided.
>*Note:* There are reserved words which must not be used as keys for ini files. These include: null, yes, no, true, false, on, off, none. Values null, off, no and false result in "", and values on, yes and true result in "1", unless *INI_SCANNER_TYPED* mode is used (as of PHP 5.6.1). Characters ?{}|&~!()^" must not be used anywhere in the key and have a special meaning in the value.

Why am I talking about this?
I spent todays trying to debug my variables and just didn’t know why PHP-FPM was failing each time I ran a test to check the configuration `php-fpm -t` and it turns out, one of the variable value had an `!` character.

```
PHP:  syntax error, unexpected '!' in Unknown on line 1
[16-Jul-2016 05:24:41] ERROR: Unable to include /etc/php5/fpm/pool.d/www.conf from /etc/php5/fpm/php-fpm.conf at line 404
[16-Jul-2016 05:24:41] ERROR: failed to load configuration file '/etc/php5/fpm/php-fpm.conf'
[16-Jul-2016 05:24:41] ERROR: FPM initialization failed
```

I hope this helps someone and save you from the trouble I had to deal with.