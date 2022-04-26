# Cron Syntax

Weekdays and months can alternatively be written as follows

````
0 */2 * JAN WED /run/this/on/wednesday.sh

# same as:
0 */2 * 1 3 /run/this/on/wednesday.sh
````

---

More cron syntax:

```
#       +------------------------------------ minute (0 - 59)
#       |       +---------------------------- hour (0 - 23)
#       |       |       +-------------------- day of month (1 - 31)
#       |       |       |       +------------ month (1 - 12)
#       |       |       |       |       +---- day of week (0 - 6) (Sunday=0 or 7)
#       |       |       |       |       |

#       10      2       *       *       *       <command>

0        0    */2       *     JAN     WED       /run/this/on/wednesday.sh     
```

## Ranges

Ever hour between 8AM and 3PM.

```
0 8-15 * * * /script.sh
```

## Lists

```
0 8,9,10,11,12,13,14,15 * * * /script.sh
```

## Step values

Every 2 hours.

```
*/2 * * * /script.sh
```

## Month and week names

```
0 0 * AUG SUN /script.sh
```

```
0 - SUN      Sunday
1 - MON      Monday
2 - TUE      Tuesday
3 - WED      Wednesday
4 - THU      Thursday
5 - FRI      Friday
6 - SAT      Saturday
7 - SUN      Sunday
```

## Special shortcuts

```
string         meaning
------         -------
@reboot        Run once, at startup.
@yearly        Run once a year, "0 0 1 1 *".
@annually      (same as @yearly)
@monthly       Run once a month, "0 0 1 * *".
@weekly        Run once a week, "0 0 * * 0".
@daily         Run once a day, "0 0 * * *".
@midnight      (same as @daily)
@hourly        Run once an hour, "0 * * * *".
```

```
@daily /script.sh

# same as:
0 0 * * * /script.sh
```

## Source

* [Different ways of writing crontab syntax](https://ma.ttias.be/different-ways-of-writing-crontab-syntax/)
