# MySQL

## Basics

### Database

List all databases:

```sql
SHOW DATABASES;
```

Use database:

```sql
USE db_name;
```

### Table

List all tables:

```sql
SHOW TABLES;
```

### Columns

List all columns:

```sql
SHOW COLUMNS FROM table_name;
```

### Select

Select everything from table:

```sql
SELECT * FROM table_name
```

Search for `no wanted headers` in column `returned_text` in table `imapsync` and return value in column `user1`:

```sql
SELECT user1 FROM imapsync WHERE returned_text LIKE '%no wanted headers%';
```

### Update

Set `auto_archive` to `1`, where `auto_archive` is set to `0`:

```sql
UPDATE segment SET auto_archive = '1' WHERE auto_archive = '0';
```

### Count

Count rows in table `wp_users`:

```sql
SELECT COUNT(*) FROM wp_users;
```

## Maintenance

### Repair

If DB is running but a table is corrupt:

```shell
mysqlcheck -A | grep -v OK
```

If `mysqlcheck` does not work or DB does not start:

```shell
echo "innodb_force_recovery=1" >> /etc/mysql/my.cnf
service mysql start
```

### Optimize table

Reorganizes the storage of table data and associated index data, to reduce storage space and improve I/O efficiency when accessing the table.

```sql
OPTIMIZE TABLE `matomo_log_visit`;
```

## Primary Replica (MariaDB)

Start:

```sql
START SLAVE;
```

Stop:

```sql
STOP SLAVE;
```

Status:

```sqsl
SHOW SLAVE STATUS \G
```

## CLI Commands

### Dump DB to File

```shell
mysqldump --single-transaction $DB_NAME > dump.sql
```

* `--single-transaction`: Sends a `START TRANSACTION` SQL statement to the server before dumping data.
                          It is useful only with transactional tables such as InnoDB, because then it dumps the consistent
                          state of the database at the time when BEGIN was issued without blocking any applications.

### Process List

List running sql queries:

```sql
show processlist;
SHOW FULL PROCESSLIST;
```

## Snippets

### Compare Tables from different Databases

Compare 'id' from table 'table' from db 'db1' with 'id' from table 'table' from db 'db2':

```sql
SELECT id
FROM db1.table
WHERE id NOT IN
    (SELECT id
     FROM db2.table);
```

### Binary Logs

Delete all binary logs.

```shell
RESET MASTER;
```
