# puppet-php-fact
Temporary repository for developing a Puppet custom PHP fact.

## What this fact returns

This custom fact will return all installed versions of php including multiple
Software Collections version. This is more useful than the typical version
returned by `php -v` because this fact also returns the backported patch number.
You can find information about backporting at https://access.redhat.com/security/updates/backporting

### Example Facter Output:

This is what it looks like when you have the stock PHP installed along with the
5.5 version that is only available via CentOS or SoftwareCollections.org and
versions 5.6 and 7.0 from Red Hat.

```json
"php_packages": {
  "php": {
    "full_version": "5.4.16-42",
    "base_version": "5.4.16",
    "major": "5",
    "minor": "4",
    "revsion": "16",
    "backport": "42",
    "os": "el7",
    "arch": "x86_64",
    "package": "php-5.4.16-42.el7.x86_64"
  },
  "php55": {
    "full_version": "5.5.21-5",
    "base_version": "5.5.21",
    "major": "5",
    "minor": "5",
    "revsion": "21",
    "backport": "5",
    "os": "el7",
    "arch": "x86_64",
    "package": "php55-php-5.5.21-5.el7.x86_64",
    "software_collection": "php55"
  },
  "php56": {
    "full_version": "5.6.25-1",
    "base_version": "5.6.25",
    "major": "5",
    "minor": "6",
    "revsion": "25",
    "backport": "1",
    "os": "el7",
    "arch": "x86_64",
    "package": "rh-php56-php-5.6.25-1.el7.x86_64",
    "software_collection": "rh-php56"
  },
  "php70": {
    "full_version": "7.0.10-2",
    "base_version": "7.0.10",
    "major": "7",
    "minor": "0",
    "revsion": "10",
    "backport": "2",
    "os": "el7",
    "arch": "x86_64",
    "package": "rh-php70-php-7.0.10-2.el7.x86_64",
    "software_collection": "rh-php70"
  }
}
```
