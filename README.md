# Wait Wait Don't Tell Me! Stats Page Database

## Overview

This repository contains the initial database schema for the
[Wait Wait Don't Tell Me! Stats Page](https://stats.wwdt.me)
database running on either MySQL or MariaDB.

## Requirements

- MySQL Server 5.6 or MariaDB Server 10.0 or newer
- Support for InnoDB enabled for either MySQL Server or MariaDB server

## Installation

This script is designed to be run against a new and empty MySQL or MariaDB
database. It can be imported using the `mysql` or `mariadb` command line
tool or using any compatible database management tool.

All of the tables are created as InnoDB and use a default charset of `utf8`.

## Database Versions

### Version 4.1 (Current)

The initial database script and database diagram files for version 4 of the
Stats Page database are located in the `v4.1` directory.

Version 4.1 brings the database, tables and all text columns to use the `utf8mb4`
character set and `utf8mb4_unicode_ci` collation instead of `utf8` and
`utf8_general_ci` used in prior versions. The change in character set did not
require any changes in column data types, sizes or indexes.

This version of the database corresponds with the current versions of the
following Wait Wait... Don't Tell Me! projects.

- [libwwdtm](https://github.com/questionlp/libwwdtm)
- [wwdtm](https://github.com/questionlp/wwdtm)
- [api.wwdt.me](https://github.com/questionlp/api.wwdt.me)
- [api.wwdt.me_v2](https://github.com/questionlp/api.wwdt.me_v2)
- [graphs.wwdt.me](https://github.com/questionlp/graphs.wwdt.me)
- [reports.wwdt.me](https://github.com/questionlp/reports.wwdt.me)
- [stats.wwdt.me](https://github.com/questionlp/stats.wwdt.me)
- [stats.wwdt.me_v5](https://github.com/questionlp/stats.wwdt.me_v5)
- [wwdtm_slugify](https://github.com/questionlp/wwdtm_slugify)

The database diagram for the database was generated using
[MySQL Workbench](https://www.mysql.com/products/workbench/):

![Wait Wait Don't Tell Me Stats Page Database Diagram](v4.1/wwdtm_Diagram.png)

### Version 4

The initial database script and database diagram files for version 4 of the
Stats Page database are located in the `v4` directory.

Version 4 of the database sheds all of the views that were created for previous
versions of the database and the Stats Page.

### Version 3

The initial database script and database diagram files for version 4 of the
Stats Page database are located in the `v3` directory.

This version of the database corresponds with the legacy versions of the Wait
Wait... Don't Tell Me! Stats Page web application:

- [wwdtm_v2](https://github.com/questionlp/wwdt.me_v2)
- [wwdtm_v3](https://github.com/questionlp/wwdt.me_v3)

The database diagram for the database was generated using
[MySQL Workbench](https://www.mysql.com/products/workbench/):

![Wait Wait Don't Tell Me Stats Page Database Diagram](v3/wwdtm_Diagram.png)

## Contributing

If you would like contribute to this project, please make sure to review both
the [Code of Conduct](CODE_OF_CONDUCT.md) and the
[Contributing](CONTRIBUTING.md) documents in this repository.

## License

The database script and schema are licensed under the terms of the
[Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).
