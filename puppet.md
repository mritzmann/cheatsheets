# Puppet

## Notify

```shell
notify {"${name}: test message":}
```

## Dry-Run

```shell
puppet agent --test --noop
```

## Local Testing

`puppet.pp`:

```pp
$message = "Hello World!"
notify {"$message":}
```

Run with: `puppet apply puppet.pp`

## Validate Variables

```puppet
# validate $ensure
if !($ensure =~ /^(present|absent)$/) {
  fail("ensure must be present or absent, got: ${ensure}")
}

# validate $monitoring
if !($monitoring == true or $monitoring == false) {
  fail("monitoring must be true or false, got: ${monitoring}")
}
```

## Delete leftovers if set to absent

```puppet
# Package
package { 'apache2':
  ensure => $ensure
}

# File
file { '/etc/apache2/apache2.conf':
  ensure  => $ensure ? {
    'present' => file,
    'absent'  => absent,
  },
  content => template('apache2/apache2.conf.erb'),
}

# Directorie
file { '/etc/apache2/sites-enabled':
  ensure  => $ensure ? {
    'present' => directory,
    'absent'  => absent,
  },
}
```
