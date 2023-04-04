# SQL

## Database

List all databases:

```sql
SHOW DATABASES;
```

Use database:

```sql
USE db_name;
```

## Table

List all tables:

```sql
SHOW TABLES;
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
