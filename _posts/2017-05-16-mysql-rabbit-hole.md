---
layout: post
title:  "MySQL Rabbit Hole: Adventure in data recovery"
date:   2017-05-16 07:36:00
categories: engineering
description: "Recently, an old project of mine died mysteriously—I don’t think so, things rarely die mysteriously, something had gone wrong; MySQL wasn’t running and there was a potential data loss"
---
Recently, an old project of mine died mysteriously—I don’t think so, things rarely die mysteriously, something had gone wrong; MySQL wasn’t running and there was a potential data loss. What was more frustrating about this was the fact that I had procrastinated the database replication and backup for the longest of time. This was all my fault. 

Over the last couple of months, there have a sizable amount of data that I had collected and I didn’t imagine myself going through the process of collecting these data again and as such, excuses weren’t an option. I had recovered it with as little information that I had at my disposal. 

To begin this process, I needed to first create the database on a fresh MySQL instance. 
```sql
CREATE DATABASE children DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER ’nimo'@'%' IDENTIFIED BY ‘password';
GRANT ALL PRIVILEGES on children.* TO ’username'@'%';
```

The first mistake made was that I had deleted some files from the  `/var/lib/mysql` directory. In hindsight, my journey to recovery would have been a lot less painful had I backed up the content of this directory, but hindsight, they say is 20-20

I messed up and did the one thing no same person should do, I ran 
`sudo rm` on a production server. It turns out, MySQL needed these files `ibdata1`,  `ib_logfile1`,  `ib_logfile0` to function well, this is particularly important if you are moving the files from an InnoDB table. 
The  `ibdata1`,  `ib_logfile1`,  `ib_logfile0` files are at the heart of the InnoDB storage engineer. The `ib_logfile1`,  `ib_logfile0` form the redo log(a disk-based data structure used during crash recovery, to correct data written by incomplete transactions), beyond that, they record statements that attempt to change data in InnoDB tables. `ibdata1` on the other hand contain meta data about the InnoDB table, and the storage areas for one or more undo logs, the change buffer, and the doublewrite buffer. 

My only saving grace was that I managed to back up the contents of `/var/lib/mysql/database_name`. This directory holds the files that make up each table and the files are in the the `*.frm` and `*.ibd` format.  There’s also a single `db.opt` file. The `db.opt` file stores the characteristics of a database. The `*.frm` file is how MySQL represents its data on disk. The files share the same name as the table with the `*.frm` extension and this is irrespective of the storage engine used.  The `*.ibd` files, on the other hand, contain a single table and its associated index. 

### Let the fix begin. 
In other to fix this issue, I had to recreate the database schema — thankfully, my ORM provided me with a really good migration — and I paid particular attention to constraints, especially foreign keys. 

As part of the restoration process, I logged into MySQL and disabled the Foreign Key checks like this:
 `SET FOREIGN_KEY_CHECKS=0;` 
and also discarded the InnoDB tablespace
 `ALTER TABLE table_name DISCARD TABLESPACE;`.  I did this for all the newly created MySQL tables. Note that by default, InnoDB stores its tables and indexes in the system tablespace. 

> System tablespace: One or more data files (ibdata files) containing metadata for InnoDB-related objects (the InnoDB data dictionary), and the storage areas for one or more undo logs, the change buffer, and the doublewrite buffer. Depending on the innodb_file_per_table setting, it might also contain table and index data for InnoDB tables. The data and metadata in the system tablespace apply to all databases in a MySQL instance. 

*A note about discarding and importing InnoDB Tablespaces*
> An InnoDB table created in its own file-per-table tablespace can be discarded and imported using the DISCARD TABLESPACE and IMPORT TABLESPACE options. These options can be used to import a file-per-table tablespace from a backup or to copy a file-per-table tablespace from one database server to another.

After the database migration via my ORM was completed and I have completed the `ALTER TABLE table_name DISCARD TABLESPACE` for all my tables,  I restored all the `*.frm` and `*.ibd` to the newly created database directory which is located at `/var/lib/mysql/database_name`. 

I then imported the previously discarded tablespace:
 `ALTER TABLE table_name IMPORT TABLESPACE;` , like during the discarding process, I executed the importation operation for all my tables.  After the importation process was completed, I restored the Foreign Key constraint `SET FOREIGN_KEY_CHECKS=1;`

### Are we done yet?
At this point, everything should be fine and there should be peace all round, but no, MySQL has a mind of its own.  The first problem was that I suffered an index corruption, upon checking the MySQL error log, I discovered an error
```sql
[ERROR] InnoDB: Clustered record for sec rec not found 
InnoDB: index listings_slug_unique of table database.table_name 
InnoDB: sec index record PHYSICAL RECORD: n_fields 2; compact format; info bits 0
```

An index corruption is quite rare and unusual, they are mostly caused by MySQL bug or hardware failure. The solution to a corrupt index is to run `OPTIMIZE TABLE table_name`. But in most cases, this will not suffice and you could end up with funny errors like this;
```sql
mysql> OPTIMIZE TABLE table_name;
+----------------+----------+----------+-------------------------------------------------------------------+
| Table          | Op       | Msg_type | Msg_text                                                          |
+----------------+----------+----------+-------------------------------------------------------------------+
| database.table_name | optimize | note     | Table does not support optimize, doing recreate + analyze instead |
| database.table_name | optimize | error    | Invalid default value for 'end_date'                              |
| database.table_name | optimize | status   | Operation failed                                                  |
+----------------+----------+----------+—————————————————————————————————+
```

And this was exactly what happened to me.
Taking a closer look at this error,  the second line hints on what could be the possible problem  `invalid default value for ‘end_date’` . Our `end_date` column is getting an invalid timestamp. This is due to the fact that MySQL is currently set to *NO_ZERO_DATE* (strict) mode and I was trying to feed it with a timestamp in this format `0000-00-00 00:00:00`.

The workaround to this problem is to set the SQL mode to allow for invalid dates:  `SET SQL_MODE='ALLOW_INVALID_DATES';`.  The SQL mode here prevents MySQL from performing a valid date check. It checks to make sure that only the month uses a numeric range; 1 through 12 and day uses a numeric range too; 1 through 31. Note that it does not give provision for leading zeros — 01, 02, etc. 

At this point, everything seemed to have worked out pretty well. Finally, I restarted MySQL and there were much joy and praise :)

#### References
[MySQL :: MySQL 5.6 Reference Manual :: 14.7.4 InnoDB File-Per-Table Tablespaces](https://dev.mysql.com/doc/refman/5.6/en/innodb-multiple-tablespaces.html)
[MySQL InnoDB lost tables but files exist - Super User](https://superuser.com/questions/675445/mysql-innodb-lost-tables-but-files-exist)