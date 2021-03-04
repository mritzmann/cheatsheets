# MySQL

## Database

```mysql
# list all
SHOW DATABASES;

# use database
USE db_name;
```

## Table

```mysql
# lit all
SHOW TABLES;
```

## Columns

```mysql
# show alle columns
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
