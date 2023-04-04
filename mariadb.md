# MariaDB

Community-developed, commercially supported fork of MySQL.

## Repair

If DB is running but a table is corrupt:

```shell
mysqlcheck -A | grep -v OK
```

If `mysqlcheck` does not work or DB does not start:

```shell
echo "innodb_force_recovery=1" >> /etc/mysql/my.cnf
service mysql start
```

## Optimize table

Reorganizes the storage of table data and associated index data, to reduce storage space and improve I/O efficiency when accessing the table.

```sql
OPTIMIZE TABLE `matomo_log_visit`;
```

## Primary Replica

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

## Dump DB to File

```shell
mysqldump --single-transaction $DB_NAME > dump.sql
```

* `--single-transaction`: Sends a `START TRANSACTION` SQL statement to the server before dumping data.
                          It is useful only with transactional tables such as InnoDB, because then it dumps the consistent
                          state of the database at the time when BEGIN was issued without blocking any applications.

## Process List

List running sql queries:

```sql
show processlist;
SHOW FULL PROCESSLIST;
```

## Binary Logs

Delete all binary logs.

```shell
RESET MASTER;
```
