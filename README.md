# paprogen

A simple bash script that generates partition procedures for mysql tables.

## Usage

```
cd paprogen<br>
./partition_procedure_gen.sh<br>
myschema | mytable | 6 | 36 <br>
press <Enter><br>
add another line of table information<br>
<br>
press <Enter> twice to generate files
```
	
	
The generated file is in the project directory as output.sql


The format for the table information is as follows
<schema name> | <table name> | partition range in months | retention period in months
