=====
About
=====

This is basic sample using `SOCI <https://github.com/soci/soci>`_ (Simple
Open Call Interface) to access sqlite3 DB.

.. note:: invoke ``make`` twice. For some reasons SOCI tries to run tests
        although ``set(SOCI_TESTS OFF) is called. After compiling for the
        second time tests are not run.


Dependencies
============

* sqlite3 development files::

        $ sudo apt-get install libsqlite3-dev

* sqlite3 CLI tool (**optional**)::

        $ sudo apt-get install sqlite3

* SOCI lib https://github.com/soci/soci::



Usin Sqlite3 CLI
================


Create databse
---------------

::

        $ sqlite3 test.db
        sqlite> .exit


Create table
------------

::

        $ sqlite3 test.db
        sqlite> create table users(id text primary key, pass text);
        sqlite> .exit


Insert new records to table
---------------------------

::

        $ sqlite3 test.db
        sqlite> insert into users values ('user1', 'pass1');
        sqlite> .exit


Select records from table
-------------------------

::

        $ sqlite test.db
        sqlite> select * from users;
        sqlite> .exit
