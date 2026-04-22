Stored Procedures Documentation
General idea

In this task I implemented a fake data generator using MySQL stored procedures.
The main idea is to generate user data directly in MySQL instead of using external libraries.

The data is not truly random. It depends on input values (seed, batch, locale), so if you run the same query again, you'll get the same result.

Main procedure
generate_batch(seed_val, batch_val, locale_val)

This procedure generates 10 users and returns them as a table.

Parameters
seed_val – used for generating values
batch_val – used to get different groups of users
locale_val – selects names for a specific region (for example en_US)

Example:

CALL generate_batch(1, 0, 'en_US');

Tables

There are two lookup tables:

first_names
last_names

Both tables have a locale column, so we can store multiple languages in the same table instead of creating separate ones.

How generation works
Random numbers

I didn’t use random() function. Instead I used:

CRC32(CONCAT(...)) (Even knowing it's lacking security patterns)

This generates a number based on input values.
Because of that, the same inputs always produce the same outputs.

Names

To select a name:

count how many names exist for that locale
generate a number
use modul to get an index
select name using LIMIT and OFFSET
Full name

Full name is just combining first name and last name.

Email

Email is generated from the name, like:

firstname.lastname@example.com

Everything been converted to lowercase.

Phone

Phone numbers are generated using parts of the number from CRC32.
Format looks like:

+1-XXX-XXX-XXXX

It’s not a real phone number, just formatted to look realistic.

Coordinates (still working on it)


Reproducibility

If I run:

CALL generate_batch(1, 0, 'en_US');

multiple times, I always get the same users.

If I change seed or batch, I get different data.

Notes
duplicates can happen, this is ok (due to limited names set)
if there are more names in tables, results look better (however my terminal is falling once i/m adding arr with more keys in it)
more fields would be added later (address, more names choices, GERMAN version etc.)

Progress note

Started working on HTML and Flask part, but currently not fully used, because dataset had issues and had to be restored.

Right now testing is done via MySQL CLI:

mysql -u root fake_data

All procedures are stored in procedure.sql.

Will update Flask/HTML part later after stabilizing database.