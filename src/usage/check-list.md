# Working with a checklist

## Build your checklist

First, define your check by constructing a `\Gerardojbaez\PhpCheckup\Checks` instance:

```php
use \Gerardojbaez\PhpCheckup\Check;
use \Gerardojbaez\PhpCheckup\Checks\Php\ExtensionIsLoaded;

$check = new Check('"mbstring" is loaded', new ExtensionIsLoaded('mbstring'));
```

Optionally customize the check's type, success, and fail message:

```php
$check->critical();
$check->passing('"mbstring" is loaded');
$check->failing('Please make sure "mbstring" is installed and enabled');
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
