#!/bin/sh

echo "Welcome!  I can help with you creating a procedure for partitioning tables by date range in mysql db";
echo "Please enter the details in the following format. You can enter multiple lines to create multiple procedures ";
echo "schema name|table name|partition range in months|retention period in months";

generate_procedure() {

    if [[ -z $1 ]]; then
		return;
	fi
		
	IFS='|'; read -ra schema_info <<< "$1"
	schema_name=${schema_info[0]};
	table_name=${schema_info[1]};
	partition_range=${schema_info[2]};
	retention_period=${schema_info[3]};
	
	gsed 's/<schema_name>/'$schema_name'/g 
		s/<table_name>/'$table_name'/g  
		s/<partition_range>/'$partition_range'/g  
		s/<retention_period>/'$retention_period'/g' < "templates/mysql_partition_procedure.sql.template";
	
	
}


declare inputs;
let count=0;
while read -ra feed; do
	if [[ -z $feed ]]; then
		break;
	fi
	let count=count+1;
	inputs[count]="$feed";
done

rm -f output.sql;

for i in "${inputs[@]}"; do
	generate_procedure "$i" >> output.sql;
done
