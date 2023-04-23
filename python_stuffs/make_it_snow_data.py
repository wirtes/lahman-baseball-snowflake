#!/Library/Frameworks/Python.framework/Versions/3.10/bin/python3

import re


#        .----------.
#       /  .-.  .-.  \
#      /   | |  | |   \
#      \   `-'  `-'  _/
#      /\     .--.  / |
#      \ |   /  /  / /
#      / |  `--'  /\ \
#       /`-------'  \ \   
#
# Don't look at me! I'm hideous!!!

def parse_sql(line):
	# Let's roll up our sleeves & hack this puppy. Welcome to real-world data cleansing.
	
	# This splits the off the data sets after "VALUES" and it removes the start & end parens
	line_split = line.split("VALUES ")[1][1:-1]
	# This splits the rest of the string into discreet data sets
	data_sets = line_split.split("),(")
	return data_sets
	

# Open the input and output files
with open("./mysql_source/snowflake_data_orig.sql", "r") as input_file:
	# Loop through each line in the input file
	table_name = ""
	search_string = "INSERT\sINTO\s(\w+)\s"
	for line in input_file:
		# If we've got the beginning of a SQL INSERT, hack it.
		if line.startswith("INSERT INTO"):
			# pull out the table name from the insert statement.
			# We'll use this for file naming & chunking the output into separate files.
			results = re.search(r'INSERT\sINTO\s(\w+)\s', line)
			if results:
				if results.group(1) == table_name:
					# This is for debugging
					# I'm assuming that the SQL dump is grouped by table.
					# I'll lose data if it isn't. So if we lost data, check here first.
					print("Table Name already set to " + table_name)
				else:
					table_name = results.group(1)
					output_file = open("./output_csv/" + table_name + "_csv.csv", "w")
					print("Changing table_name to " + table_name)
				# parse the values out of the SQL
				data_sets = parse_sql(line)
				# write it out:
				for row in data_sets:
					# One. More. Hack.
					# Get rid of some trailing SQL syntax.
					if row.endswith(");"):
						row = row[:-2]
					output_file.write(row + "\n")
			else:
				print("No match")

