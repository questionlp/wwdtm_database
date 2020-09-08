# Wait Wait Don't Tell Me! Stats Page Database

## Overview

This repository contains the initial database schema for the [Wait Wait Don't Tell Me! Stats Page](https://stats.wwdt.me)
database running on either MySQL or MariaDB.

## Requirements

- MySQL Server 5.6 or MariaDB Server 10.0 or newer
- Support for InnoDB enabled for either MySQL Server or MariaDB server

## Installation

This script is designed to be run against a new and empty MySQL or MariaDB
database. It can be imported using the `mysql` or `mariadb` command line
tool or using any compatible database management tool.

All of the tables are created as InnoDB and use a default charset of `utf8`.

## Contributing

If you would like contribute to this project, please make sure to review both
the [Code of Conduct](CODE_OF_CONDUCT.md) and the
[Contributing](CONTRIBUTING.md) documents in this repository.

## License

The database script and schema are licensed under the terms of the
[Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).
