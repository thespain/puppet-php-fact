# puppet-php-fact
Temporary repository for developing a Puppet custom PHP fact.

## Limitations
Currently, this fact adds almost 2 seconds of run time to fater most likely
due to using the rpm command, then prasing it out into hashes.

## What this fact returns

This custom fact will return all installed versions of php including multiple
Software Collections version. This is more useful than the typical version
returned by `php -v` because this fact also returns the backported patch number.
You can find information about backporting at https://access.redhat.com/security/updates/backporting

### PHP installed from base repo returns:
```YAML
    "php_releases": [
      "5.4"
    ],
    "php_versions": {
      "5.4": {
        "os": "package rh-5",
        "arch": "4-php is not installed",
        "revision": "",
        "major": "",
        "minor": "",
        "full": "..-",
        "backport": ""
      }
    },

```

### PHP56 from Software Collections:
```YAML
    "php_releases": [
      "php56"
    ],
    "php_versions": {
      "php56": {
        "os": "el7",
        "arch": "x86_64",
        "revision": "25",
        "major": "5",
        "minor": "6",
        "full": "5.6.25-1",
        "backport": "1"
      }
    },
```

### PHP56 and PHP70 from Software Collections:
```YAML
    "php_releases": [
      "php56",
      "php70"
    ],
    "php_versions": {
      "php56": {
        "os": "el7",
        "arch": "x86_64",
        "revision": "25",
        "major": "5",
        "minor": "6",
        "full": "5.6.25-1",
        "backport": "1"
      },
      "php70": {
        "os": "el7",
        "arch": "x86_64",
        "revision": "10",
        "major": "7",
        "minor": "0",
        "full": "7.0.10-2",
        "backport": "2"
      }
    },

```

### PHP from Base, PHP56 & PHP70 from Software Collections:
```YAML
   "php_releases": [
      "php",
      "php56",
      "php70"
    ],
    "php_versions": {
      "php": {
        "os": "el7",
        "arch": "x86_64",
        "revision": "16",
        "major": "5",
        "minor": "4",
        "full": "5.4.16-42",
        "backport": "42"
      },
      "php56": {
        "os": "el7",
        "arch": "x86_64",
        "revision": "25",
        "major": "5",
        "minor": "6",
        "full": "5.6.25-1",
        "backport": "1"
      },
      "php70": {
        "os": "el7",
        "arch": "x86_64",
        "revision": "10",
        "major": "7",
        "minor": "0",
        "full": "7.0.10-2",
        "backport": "2"
      }
    },
```