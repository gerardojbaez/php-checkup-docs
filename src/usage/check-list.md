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

Optionally set a check's dependency so checks will only be executed when other checks are passing:

```php
$connectionCheck->code('db-connection');
$check->dependsOn('db-connection', 'Waiting for a working database connection...');
```

When adding a dependency, always make sure to assign unique codes to each of the parents checks.

Finally, register your check with the check's manager:

```php
use \Gerardojbaez\PhpCheckup\Manager;

$manager = new Manager;
$manager->add($check);
```

## Run your checklist

To run a checklist, create a new instance of `\Gerardojbaez\PhpCheckup\Runner` and call `run()`, this method will return an instance of `\Gerardojbaez\PhpCheckup\RunResult`:

```php
use \Gerardojbaez\PhpCheckup\Runner;

$runner = new Runner();
$result = $runner->run($manager);
```

To check whether the list is passing or not, simply use the following status methods:

```php
$result->isPassing(); // returns true when all checks are passing
$result->isFailing(); // returns true when at least one check is failing
$result->isSkipping(); // returns true when at least one check is being skipped
```

To retrieve a list of check results:

```php
$result->getCheckResults(); // returns all check results
$result->getPassingChecks(); // returns all passing check results
$result->getFailingChecks(); // returns all failing check results
$result->getSkippingChecks(); // returns all skipping check results
```

You can also retrieve the count of checks:

```php
$result->getPassingCount(); // returns the count of passing checks
$result->getFailingCount(); // returns the count of failing checks
$result->getSkippinCount(); // returns the count of skipping checks
```

If you only want to run checks of a particular group, use the `group($name)` method of a manager's instance, and pass that instance to the runner:

```php
$runner = new Runner();
$result = $runner->run($manager->group('requirements'));
```

Alternatively, if you want to check multiple groups at once, simply use `groups([$one, two, ...])`:

```php
$runner = new Runner();
$result = $runner->run($manager->groups(['requirements', 'security']));
```

If you ware looking to run checks by their code:

```php
$runner = new Runner();
$result = $runner->run($manager->code('some-code'));
```

Or multiple codes:

```php
$runner = new Runner();
$result = $runner->run($manager->codes('some-code'));
```
