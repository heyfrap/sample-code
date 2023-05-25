#!/bin/bash

# Set the path to your Rails project
rails_project_path="/path/to/your/rails/project"

# Get to the Rails project directory
cd $rails_project_path

# Find all the enum declarations in all the Rails models
model_files=$(find app/models -name '*.rb')

for file in $model_files
do
  # Extract enum declarations
  enum_declarations=$(grep -o 'enum .*:.*{' $file)
  
  for declaration in $enum_declarations
  do
    # Extract enum names
    enum_name=$(echo $declaration | grep -o ':.*{' | sed -e 's/^://' -e 's/{$//')

    # Search all occurrences of enum_name usage in the project using git grep
    echo "Searching for '$enum_name.xxx' usage in the project..."
    git grep -n "$enum_name\."
  done
done

