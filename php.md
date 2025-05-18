# PHP

## Shell

Run commands:

```shell
php -r 'echo ini_get("memory_limit");'
```

Start build-in server:

```shell
php -S localhost:8888
```

## Echo

```php
echo "Hello World";
echo "Hello " . "World";
echo "Hello ", "World";
echo("Hello World");
```

```php
<?php echo "Hello world"; ?>
<?= "Hello world"; ?>
```

## Variables

```php
$greeting = "Hello World";
echo $greeting;
echo {$greeting}™;
```

## Conditionals

```shell
$boolean = true;

if ($boolean) {
  $message = "Boolean is true";
} else {
  $message = "Boolean is false";
}
```

## Arrays

```php
$books = [
  "The Art of Thinking Clearly",
  "Atomic Habits",
  "The Hitchhikers Guide to the Galaxy"
];

<?php foreach ($books as $book) {
  echo $book;
}
```
