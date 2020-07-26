# Working with a checklist

## Build your checklist

First, define your check by constructing a `\Gerardojbaez\PhpCheckup\Check` instance:

```php
use \Gerardojbaez\PhpCheckup\Check;
use \Gerardojbaez\PhpCheckup\Checks\MinimumVersion;

$check = new Check('PHP v7.2.0 or newer', new MinimumVersion('7.2.0', phpversion()));
```

Set the severity of the check:

- `critical` for critical checks that needs immediate attention; this is the default check type.
- `warning` for checks that are just warnings, and does not require immediate attention.
- `informational` for checks that are just for informational purposes.

Example:

```php
$check->critical();
```

Optionally customize the check's passing and failing messages. If a check returns formatting data, use it to dynamically format both messages:

```php
$check->passing('You are using PHP :current_version');
$check->failing('Upgrade your PHP version to :target_version or newer.');
```

Optionally add the check to a group:

```php
$check->group('requirements');
```

Finally, register your check with the check's manager:

```php
use \Gerardojbaez\PhpCheckup\Manager;

$checks = new Manager;
$checks->add($check);
```

## Run your checklist

To run a checklist, simply call the `isPassing()` method of the manager's instance, this method will return `true` when all checks are passing, or `false` otherwise:

```php
$manager->isPassing(); // true or false
```

Alternatively, you can use the `passing()` method of a manager's instance to get a count of passing checks. For example, if you have 5 checks registered, and only two are passing, 2 is returned.

```php
$manager->passing(); // 1, 2, 3, etc...
```

If you only want to run checks of a particular group, use the `group($name)` method of a manager's instance:

```php
$manager->group('requirements')->isPassing();
```

Alternatively, if you want to check multiple groups at once, simply use `groups([$one, two, ...])`:

```php
$manager->groups(['requirements', 'security'])->isPassing();
```
