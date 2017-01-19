# Example Salt Managed Infrastructure

This is an example of a simple Salt managed infrastructure. The main
concentration of this repository is to demonstrate salt states.

## Disclaimer

**DO NOT** USE IN PRODUCTION! THIS CONFIGURATION AUTO-ACCEPTS MINION KEYS!

## Architecture

    +---------+     +--------+
    |   App   | --> |   Db   |
    +---------+     +--------+
         ^               ^
         |               |
         +---------------+
                 |
                 |
             +--------+
             | Master |
             +--------+

## Servers

There are 3 servers: a salt master, an app server and a database server.

 - Salt Master (master.salt.local): 10.10.8.2
 - App, SQL Buddy (app.salt.local): 10.10.8.3
 - Db, MySQL (db.salt.local): 10.10.8.4

## Getting started

This is fairly simple to start, simply:

  vagrant up

Enjoy!
