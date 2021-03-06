# MySQL

## Repair

If DB is running but a table is corrupt:

```shell
mysqlcheck -A | grep -v OK
```

## Database

```mysql
# list all
SHOW DATABASES;

# use database
USE db_name;
```

## Table

```mysql
# list all
SHOW TABLES;
```

## Columns

```mysql
# list all
SHOW COLUMNS FROM table_name;
```

## Select

```mysql
# select 
SELECT * FROM table_name

# search
# - search for 'no wanted headers' in returned_text
# - and returns values in colum user1
SELECT user1 FROM imapsync WHERE returned_text LIKE '%no wanted headers%';
```

## Update

```sql
# set auto_archive to 1, where auto_archive is set to 0
UPDATE segment SET auto_archive = '1' WHERE auto_archive = '0';
```

## Compare Tables from different Databases

```sql
# compare 'id' from table 'table' from db 'db1' with
# 'id' from table 'table' from db 'db2'
SELECT id
FROM db1.table
WHERE id NOT IN
    (SELECT id
     FROM db2.table);
```
