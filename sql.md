# SQL

Structured Query Language.

## Writing a Schema

How to create tables.

### Data Types

* `INT`: Integer values (example: `42`)
* `FLOAT` and `DOUBLE`: Decimal or floating point values (example: `42.2`)
* `VARCHAR`: Variable-length character strings
* `DATE`, `DATETIME`, `TIMESTAMP`: Date and time values

### Create a Table

Example Schema for a new Table:

```sql
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `birthday` date,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
;)
```

```sql
CREATE TABLE student (
  student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(255) NOT NULL,
  vorname    VARCHAR(255) NOT NULL,
  email      CHAR(100)
);
```

Principles:

1. Choose the smallest data type (example: don't use `varchar(500)` for city names, use `varchar(100)` or smaller) 
2. Choose the simplest data type (for example use a date type for dates and don't save dates in `varchar`)

Storage space is cheap, that's not the point.
Smaller file types allows to create SQL indexes more efficiently and retrieve data faster.

Show table definition:

```sql
describe student;
```

## Database

```sql
# list
show databases;

# create
create database test;

# use
use test;
```

## Table

```sql
# list
show tables;
```

## Insert

```sql
INSERT INTO student (name, vorname, email)
VALUES
  ('Schmid','Norina','n.schmid@schule.ch'),
  ('Mäder','Klaus','k.maeder@schule.ch'),
  ('Kunz','Paula','p.kunz@schule.ch')
;
```

## Columns

List all columns:

```sql
SHOW COLUMNS FROM table_name;
```

## Select

Select everything from table:

```sql
SELECT * FROM table_name
```

Search for `no wanted headers` in column `returned_text` in table `imapsync` and return value in column `user1`:

```sql
SELECT user1 FROM imapsync WHERE returned_text LIKE '%no wanted headers%';
```

Join:

```sql
select name, email
from student join klasse on student.klasse = klasse.klasse_id
where klasse.bezeichnung = 'HFSNT.SG.2';
```

## Update

Set `auto_archive` to `1`, where `auto_archive` is set to `0`:

```sql
UPDATE segment SET auto_archive = '1' WHERE auto_archive = '0';
```

## Transations

Apply changes safely:

```sql
START TRANSACTION;

<changes>

# apply
COMMIT;

# or rollback
ROLLBACK;
```

## Count

Count rows in table `wp_users`:

```sql
SELECT COUNT(*) FROM wp_users;
```

## Compare Tables from different Databases

Compare 'id' from table 'table' from db 'db1' with 'id' from table 'table' from db 'db2':

```sql
SELECT id
FROM db1.table
WHERE id NOT IN
    (SELECT id
     FROM db2.table);
```
