---
home: true
heroImage: /banner2.png
actionText: Getting started
actionLink: /getting-started/introduction.html
features:
- title: Easy and quick
  details: Adding and configuring checks is easy-peasy.
- title: Flexible
  details: Use built-in checks or create your own.
- title: Standalone
  details: Framework-agnostic; use it with any framework, or as a standalone package.
footer: MIT Licensed | Copyright © 2020 Gerardo J. Báez
---

## Quick start
```php
use \Gerardojbaez\PhpCheckup\Checks\Php\ExtensionIsLoaded;
use \Gerardojbaez\PhpCheckup\Manager;
use \Gerardojbaez\PhpCheckup\Runner;

$manager = new Manager;

// Register checks
$manager->add(
    (new Check('Required PHP extension "mbstring" is installed', new ExtensionIsLoaded('mbstring')))
        ->group('requirements')
        ->passing('The extension is installed')
        ->failing('The extension is not installed. Please install or enable it before proceeding.')
        ->critical()
);

// Run checks
$runner = new Runner($manager);
$runner->run()->isPassing();
```
