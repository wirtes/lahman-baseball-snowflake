#!/Library/Frameworks/Python.framework/Versions/3.10/bin/python3

# Open the input and output files
with open("./mysql_source/updated-lahman-mysql.sql", "r") as input_file, open("./snowflake.sql", "w") as output_file:
    # Loop through each line in the input file
    for line in input_file:
        # Remove all "`" characters from the line
        line_without_backticks = line.replace("`", "")
        # Write the processed line to the output file
        output_file.write(line_without_backticks)
