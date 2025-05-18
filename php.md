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

# echo every item
<?php foreach ($books as $book) {
  echo $book;
}

# echo second item
<?= $books[2] ?>

# create html list
<ul>
  <?php foreach ($books as $book) {
    echo "<li>$book</li>";
  }
  ?>
</ul>

# create html list (template friendly)
<ul>
  <?php foreach ($books as $book) : ?>
    <li><?= $book; ?></li>
  <?php endforeach; ?>
</ul>
```

## Associative Arrays

```php
<?php
	$books = [
		[
			"name" => "The Art of Thinking Clearly",
			"author" => "Rolf Dobelli",
			"wiki" => "https://en.wikipedia.org/wiki/The_Art_of_Thinking_Clearly"
		],
		[
			"name" => "The Hitchhikers Guide to the Galaxy",
			"author" => "Douglas Adams",
			"wiki" => "https://en.wikipedia.org/wiki/Douglas_Adams"
		]
	];
?>

<ul>
	<?php foreach ($books as $book) : ?>
		<li>
			<a href="<?= $book["wiki"]; ?>">
				<?= $book["name"]; ?>
			</a>
		</li>
	<?php endforeach; ?>
</ul>
```
