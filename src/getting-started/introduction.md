# Introduction

Framework agnostic application health and requirement checks.

## Why

Application health-checks is a great way to see how an application is performing at any given time and to see what needs immediate attention. They also improve communication by allowing users to quickly and easily share important environment-specific information with developers.

PHP Checkup aims to provide the foundation for such functionality by giving developers a list of common checks, a quick way to add new custom checks, and an easy way to run all or a portion of them.

## Use cases
- Application pre-installation checks
    - For example, to make sure that the server meets all the minimum requirements
- Application post-installation checks
    - For example, make sure that the front-page and API are returning 200 status code, and
    - oAuth server is properly configured, and
    - Installer is disabled
- Application post-update checks
- A webpage inside an administrative system showing all the health checks of the application.
- A stand-alone package so users can check whether their server meet a minimum set of requirements for a particular application, before purchasing.
- Application performance check-list and suggestions.
- Perform environment-specific checks

## Example health checkss
- URL HTTP Status
- Database connection
- Database type
- Database version
- PHP version
- PHP installed extensions
- PHP memory limit
- PHP INI settings (more commonly used for suggestions and security checks)
- Queue status
- Last cronjob executed (maybe show a warning when last cronjob is older than a specified date)
- Writable directory or file
- Expected directory structure
- Presence/absence of a file or directory
- Payment gateway connection
- Email service connection
- Make sure private files like .env aren’t accessible publicly
- Warn about debug flag on a production environment
- SSL Check
- Warn about permissive file-permissions
