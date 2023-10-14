#!/bin/bash

# Define the Python class file and JSON config file
python_file="E0V1E.py"
json_file="E0V1E.json"

# Get the current datetime in a suitable format (e.g., YYYYMMDDHHMMSS)
current_datetime=$(date +"%Y%m%d_%H%M")

# Generate the new class name and file names
new_class_name="E0V1E_$current_datetime"
new_python_file="$new_class_name.py"
new_json_file="$new_class_name.json"

# Rename the Python class file
cp "$python_file" "$new_python_file"
# Rename the JSON config file
mv "$json_file" "$new_json_file"

# Replace the class name inside the Python file
sed -i "s/class E0V1E/class $new_class_name/g" "$new_python_file"
sed -i "s/E0V1E/$new_class_name/g" "$new_json_file"

echo "Renamed Python class file to: $new_python_file"
echo "Renamed JSON config file to: $new_json_file"

