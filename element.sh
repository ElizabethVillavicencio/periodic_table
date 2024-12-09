#!/bin/bash
# This script retrieves information about chemical elements from a database.
# Database connection command
DB="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if an argument is provided; if not, display an error message and exit.
if [ -z "$1" ]; then
  echo "Please provide an element as an argument."
  exit 0
fi
# Connect to the periodic_table database and fetch element details.
# Query the database
if [[ $1 =~ ^[0-9]+$ ]]; then
  # If the argument is a number, treat it as an atomic number
  QUERY="SELECT atomic_number, name, symbol, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius
         FROM elements
         INNER JOIN properties USING(atomic_number)
         INNER JOIN types ON properties.type_id = types.type_id
         WHERE atomic_number = $1;"
else
  # Otherwise, treat it as a symbol or name
  QUERY="SELECT atomic_number, name, symbol, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius
         FROM elements
         INNER JOIN properties USING(atomic_number)
         INNER JOIN types ON properties.type_id = types.type_id
         WHERE symbol = '$1' OR name = '$1';"
fi

RESULT=$($DB "$QUERY")

# Check if the element exists
if [ -z "$RESULT" ]; then
  echo "I could not find that element in the database."
  exit 0
fi

# Parse the result
IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING <<< "$RESULT"

# Output the result
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
