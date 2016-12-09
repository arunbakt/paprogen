# paprogen

A simple bash script that generates partition procedures for mysql tables.

## Usage

```cd paprogen

./partition_procedure_gen.sh

myschema | mytable | 6 | 36 

press <Enter>
	
add another line of table information

press <Enter> twice to generate files```
	
	
The generated file is in the project directory as output.sql


The format for the table information is as follows
<schema name> | <table name> | partition range in months | retention period in months
