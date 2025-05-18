# PHP

## Shell

Run simple php commands:

```shell
php -r 'echo ini_get("memory_limit");'
```

Start dev webserver:

```shell
php -S localhost:8888
```

## Echo

```php
echo "Hello World"
echo "Hello " . "World";
echo("Hello World");
echo "Hello ", "World";
```

```php
<?php echo "Hello world"; ?>
<?= "Hello world"; ?>
```

## Variables

```php
$greeting = "Hello World";
echo $greeting;
```

## Conditionals

```shell
$boolean = true;

if ($boolean) {
  $message = "Boolean is true";
} else {
  $message = "Boolean is false";
}

print $message;
```
