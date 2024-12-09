-- Create table for elements
CREATE TABLE elements (
    atomic_number INTEGER PRIMARY KEY,
    symbol TEXT,
    name TEXT
);

-- Create table for properties
CREATE TABLE properties (
    atomic_number INTEGER PRIMARY KEY,
    atomic_mass REAL,
    melting_point_celsius REAL,
    boiling_point_celsius REAL
);

-- Insert data into the elements table
INSERT INTO elements (atomic_number, symbol, name)
VALUES 
(1, 'H', 'Hydrogen'), 
(2, 'He', 'Helium'), 
(3, 'Li', 'Lithium'), 
(4, 'Be', 'Beryllium'), 
(5, 'B', 'Boron'), 
(6, 'C', 'Carbon'), 
(7, 'N', 'Nitrogen'), 
(8, 'O', 'Oxygen'),
(9, 'F', 'Fluorine'),
(10, 'Ne', 'Neon');

-- Insert data into the properties table
INSERT INTO properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius)
VALUES 
(1, 1.008, -259.1, -252.9), 
(2, 4.0026, -272.2, -269), 
(3, 6.94, 180.54, 1342), 
(4, 9.0122, 1287, 2470), 
(5, 10.81, 2075, 4000),
(6, 12.011, 3550, 4027),
(7, 14.007, -210.1, -195.8),
(8, 15.999, -218, -183),
(9, 18.998, -220, -188.1),
(10, 20.18, -248.6, -246.1);
