-- Drop tables if they exist to ensure a clean creation
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Donation';
    EXECUTE IMMEDIATE 'DROP TABLE Donor';
    EXECUTE IMMEDIATE 'DROP TABLE Volunteer';
    EXECUTE IMMEDIATE 'DROP TABLE Bikes';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Create the Bikes table without unique constraint on DESCRIPTION
CREATE TABLE Bikes (
    BIKE_ID VARCHAR2(10) PRIMARY KEY,
    DESCRIPTION VARCHAR2(20) NOT NULL,
    BIKE_TYPE VARCHAR2(20) NOT NULL,
    MANUFACTURER VARCHAR2(20) NOT NULL
);

-- Insert data into Bikes table
INSERT INTO Bikes (BIKE_ID, DESCRIPTION, BIKE_TYPE, MANUFACTURER) VALUES ('B001', 'BMX AX1', 'Road Bike', 'BMX');
INSERT INTO Bikes (BIKE_ID, DESCRIPTION, BIKE_TYPE, MANUFACTURER) VALUES ('B002', 'Giant Domain 1', 'Road Bike', 'Giant');
INSERT INTO Bikes (BIKE_ID, DESCRIPTION, BIKE_TYPE, MANUFACTURER) VALUES ('B003', 'Ascent 26In', 'Mountain Bike', 'Raleigh');
INSERT INTO Bikes (BIKE_ID, DESCRIPTION, BIKE_TYPE, MANUFACTURER) VALUES ('B004', 'Canyon 6X', 'Kids Bike', 'Canyon');
INSERT INTO Bikes (BIKE_ID, DESCRIPTION, BIKE_TYPE, MANUFACTURER) VALUES ('B005', 'Marvel', 'Gravel Road Bike', 'BMX');
INSERT INTO Bikes (BIKE_ID, DESCRIPTION, BIKE_TYPE, MANUFACTURER) VALUES ('B006', 'Mountain 21 Speed', 'Mountain Bike', 'BMX');
INSERT INTO Bikes (BIKE_ID, DESCRIPTION, BIKE_TYPE, MANUFACTURER) VALUES ('B007', 'Canyon Roadster', 'Road Bike', 'Canyon');
INSERT INTO Bikes (BIKE_ID, DESCRIPTION, BIKE_TYPE, MANUFACTURER) VALUES ('B008', 'Legion 101', 'Hybrid Bike', 'BMX');
INSERT INTO Bikes (BIKE_ID, DESCRIPTION, BIKE_TYPE, MANUFACTURER) VALUES ('B009', 'Madonna 9', 'Road Bike', 'Trek');
INSERT INTO Bikes (BIKE_ID, DESCRIPTION, BIKE_TYPE, MANUFACTURER) VALUES ('B010', 'Comp 2022', 'Mountain Bike', 'Trek');
INSERT INTO Bikes (BIKE_ID, DESCRIPTION, BIKE_TYPE, MANUFACTURER) VALUES ('B011', 'BMX AX15', 'Road Bike', 'BMX');

-- Create the Donor table
CREATE TABLE Donor (
    DONOR_ID VARCHAR2(10) PRIMARY KEY,
    DONOR_FNAME VARCHAR2(20) NOT NULL,
    DONOR_LNAME VARCHAR2(20) NOT NULL,
    CONTACT_NO VARCHAR2(15),
    EMAIL VARCHAR2(50)
);

-- Insert data into Donor table
INSERT INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID11', 'Jeff', 'Wanya', '0827172250', 'wanyajeff@ymail.com');
INSERT INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID12', 'Sthembeni', 'Pisho', '0837865670', 'sthepisho@ymail.com');
INSERT INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID13', 'James', 'Temba', '0878978650', 'jimmy@ymail.com');
INSERT INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID14', 'Luramo', 'Misi', '0826575650', 'luramom@ymail.com');
INSERT INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID15', 'Abraham', 'Xolani', '0797656430', 'axolani@ymail.com');
INSERT INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID16', 'Rumi', 'Jones', '0668899221', 'rjones@true.com');
INSERT INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID17', 'Xolani', 'Redo', '0614553389', 'xredo@ymail.com');
INSERT INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID18', 'Tenny', 'Stars', '0824228870', 'tenstars@true.com');
INSERT INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID19', 'Tiny', 'Rambo', '0715554333', 'trambo@ymail.com');
INSERT INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID20', 'Yannick', 'Leons', '0615554323', 'yleons@true.com');

-- Create the Volunteer table
CREATE TABLE Volunteer (
    VOL_ID VARCHAR2(10) PRIMARY KEY,
    VOL_FNAME VARCHAR2(20) NOT NULL,
    VOL_SNAME VARCHAR2(20) NOT NULL,
    CONTACT VARCHAR2(15),
    ADDRESS VARCHAR2(50),
    EMAIL VARCHAR2(50)
);

-- Insert data into Volunteer table
INSERT INTO Volunteer (VOL_ID, VOL_FNAME, VOL_SNAME, CONTACT, ADDRESS, EMAIL) VALUES ('vol101', 'Kenny', 'Temba', '0677277521', '10 Sands Road', 'kennyt@bikerus.com');
INSERT INTO Volunteer (VOL_ID, VOL_FNAME, VOL_SNAME, CONTACT, ADDRESS, EMAIL) VALUES ('vol102', 'Mamelodi', 'Marks', '0737377522', '20 Langes Street', 'mamelodim@bikerus.com');
INSERT INTO Volunteer (VOL_ID, VOL_FNAME, VOL_SNAME, CONTACT, ADDRESS, EMAIL) VALUES ('vol103', 'Ada', 'Andrews', '0817117523', '31 Williams Street', 'adanyaa@bikerus.com');
INSERT INTO Volunteer (VOL_ID, VOL_FNAME, VOL_SNAME, CONTACT, ADDRESS, EMAIL) VALUES ('vol104', 'Evans', 'Tambala', '0697215244', '1 Free Road', 'evanst@bikerus.com');
INSERT INTO Volunteer (VOL_ID, VOL_FNAME, VOL_SNAME, CONTACT, ADDRESS, EMAIL) VALUES ('vol105', 'Xolani', 'Samson', '0727122255', '12 Main Road', 'xolanis@bikerus.com');

-- Create the Donation table with foreign keys
CREATE TABLE Donation (
    DONATION_ID NUMBER PRIMARY KEY,
    DONOR_ID VARCHAR2(10) NOT NULL,
    BIKE_ID VARCHAR2(10) NOT NULL,
    DONATION_VALUE NUMBER NOT NULL,
    VOLUNTEER_ID VARCHAR2(10),
    DONATION_DATE DATE,
    FOREIGN KEY (DONOR_ID) REFERENCES Donor(DONOR_ID),
    FOREIGN KEY (BIKE_ID) REFERENCES Bikes(BIKE_ID),
    FOREIGN KEY (VOLUNTEER_ID) REFERENCES Volunteer(VOL_ID)
);

-- Insert data into Donation table
INSERT INTO Donation (DONATION_ID, DONOR_ID, BIKE_ID, DONATION_VALUE, VOLUNTEER_ID, DONATION_DATE) VALUES (1, 'DID11', 'B001', 1500, 'vol101', TO_DATE('01-May-23', 'DD-Mon-YY'));
INSERT INTO Donation (DONATION_ID, DONOR_ID, BIKE_ID, DONATION_VALUE, VOLUNTEER_ID, DONATION_DATE) VALUES (2, 'DID12', 'B002', 2500, 'vol101', TO_DATE('03-May-23', 'DD-Mon-YY'));
INSERT INTO Donation (DONATION_ID, DONOR_ID, BIKE_ID, DONATION_VALUE, VOLUNTEER_ID, DONATION_DATE) VALUES (3, 'DID13', 'B003', 1000, 'vol103', TO_DATE('03-May-23', 'DD-Mon-YY'));
INSERT INTO Donation (DONATION_ID, DONOR_ID, BIKE_ID, DONATION_VALUE, VOLUNTEER_ID, DONATION_DATE) VALUES (4, 'DID14', 'B004', 1750, 'vol105', TO_DATE('05-May-23', 'DD-Mon-YY'));
INSERT INTO Donation (DONATION_ID, DONOR_ID, BIKE_ID, DONATION_VALUE, VOLUNTEER_ID, DONATION_DATE) VALUES (5, 'DID15', 'B006', 2000, 'vol101', TO_DATE('07-May-23', 'DD-Mon-YY'));
INSERT INTO Donation (DONATION_ID, DONOR_ID, BIKE_ID, DONATION_VALUE, VOLUNTEER_ID, DONATION_DATE) VALUES (6, 'DID16', 'B007', 1800, 'vol105', TO_DATE('09-May-23', 'DD-Mon-YY'));
INSERT INTO Donation (DONATION_ID, DONOR_ID, BIKE_ID, DONATION_VALUE, VOLUNTEER_ID, DONATION_DATE) VALUES (7, 'DID17', 'B008', 1500, 'vol101', TO_DATE('15-May-23', 'DD-Mon-YY'));
INSERT INTO Donation (DONATION_ID, DONOR_ID, BIKE_ID, DONATION_VALUE, VOLUNTEER_ID, DONATION_DATE) VALUES (8, 'DID18', 'B009', 1500, 'vol103', TO_DATE('19-May-23', 'DD-Mon-YY'));
INSERT INTO Donation (DONATION_ID, DONOR_ID, BIKE_ID, DONATION_VALUE, VOLUNTEER_ID, DONATION_DATE) VALUES (9, 'DID12', 'B010', 2500, 'vol103', TO_DATE('25-May-23', 'DD-Mon-YY'));
INSERT INTO Donation (DONATION_ID, DONOR_ID, BIKE_ID, DONATION_VALUE, VOLUNTEER_ID, DONATION_DATE) VALUES (10, 'DID20', 'B005', 3500, 'vol105', TO_DATE('05-May-23', 'DD-Mon-YY'));
INSERT INTO Donation (DONATION_ID, DONOR_ID, BIKE_ID, DONATION_VALUE, VOLUNTEER_ID, DONATION_DATE) VALUES (11, 'DID19', 'B011', 2500, 'vol103', TO_DATE('30-May-23', 'DD-Mon-YY'));

-- Set line size and column formats for clean display in SQL*Plus
SET LINESIZE 200
COLUMN VOL_ID FORMAT A10
COLUMN VOL_FNAME FORMAT A15
COLUMN VOL_SNAME FORMAT A15
COLUMN CONTACT FORMAT A12
COLUMN ADDRESS FORMAT A30
COLUMN EMAIL FORMAT A35
COLUMN DONATION_VALUE FORMAT 99999
COLUMN DONATION_DATE FORMAT A11

-- Display the table structures
DESC Bikes;
DESC Donor;
DESC Volunteer;
DESC Donation;

-- Query data to display each table's contents
SELECT * FROM Bikes;
SELECT * FROM Donor;
SELECT * FROM Volunteer;
SELECT * FROM Donation;


-- Question 2
COLUMN "DONATION_VALUE" FORMAT A20
SELECT 
    d.DONOR_ID,
    b.BIKE_TYPE,
    b.DESCRIPTION AS BIKE_DESCRIPTION,
    'R ' || TO_CHAR(dn.DONATION_VALUE, '9,999.00') AS DONATION_VALUE
FROM 
    Donation dn
JOIN 
    Donor d ON dn.DONOR_ID = d.DONOR_ID
JOIN 
    Bikes b ON dn.BIKE_ID = b.BIKE_ID
WHERE 
    dn.DONATION_VALUE > 1500;


-- Question 3
-- Set line size to accommodate longer rows
SET LINESIZE 250

-- Set column widths to prevent wrapping
COLUMN "BIKE DESCRIPTION" FORMAT A19
COLUMN "BIKE MANUFACTURER" FORMAT A18
COLUMN "BIKE TYPE" FORMAT A15
COLUMN "VALUE" FORMAT A12
COLUMN "VAT" FORMAT A12
COLUMN "TOTAL AMNT" FORMAT A15

-- Query to display the required information with formatted output
WITH VAT_RATE AS (
    SELECT 0.15 AS RATE FROM dual
)
SELECT 
    b.DESCRIPTION AS "BIKE DESCRIPTION",
    b.MANUFACTURER AS "BIKE MANUFACTURER",
    b.BIKE_TYPE AS "BIKE TYPE",
    'R' || TO_CHAR(dn.DONATION_VALUE, '999G999D00') AS "VALUE",
    'R' || TO_CHAR(dn.DONATION_VALUE * VAT_RATE.RATE, '999G999D00') AS "VAT",
    'R' || TO_CHAR(dn.DONATION_VALUE * (1 + VAT_RATE.RATE), '999G999D00') AS "TOTAL AMNT"
FROM 
    Donation dn
JOIN 
    Bikes b ON dn.BIKE_ID = b.BIKE_ID
JOIN 
    VAT_RATE ON 1 = 1
WHERE 
    b.BIKE_TYPE = 'Road Bike';


-- Question 4
-- Create the view vwBikeRUs
CREATE OR REPLACE VIEW vwBikeRUs AS
SELECT 
    d.DONOR_FNAME || ', ' || d.DONOR_LNAME AS DONOR_NAME,
    d.CONTACT_NO AS DONOR_CONTACT,
    b.BIKE_TYPE,
    dn.DONATION_DATE
FROM 
    Donation dn
JOIN 
    Donor d ON dn.DONOR_ID = d.DONOR_ID
JOIN 
    Bikes b ON dn.BIKE_ID = b.BIKE_ID
WHERE 
    dn.VOLUNTEER_ID = 'vol105';

-- Query to run the view
COLUMN "DONATION_DATE" FORMAT A15
COLUMN "DONOR_NAME" FORMAT A15
SELECT * FROM vwBikeRUs;

-- Benefits of using a View:
-- 1. Security and Simplification: Views allow database users to access specific columns without exposing the full underlying table structure. 
--    For example, by using vwBikeRUs, the outlet can allow access to donor contact information and bike types without exposing all donor details.
-- 2. Data Consistency and Ease of Use: Views provide a consistent way to present frequently used or complex queries, simplifying database access for users. 
--    The outlet can use vwBikeRUs to quickly retrieve donor information for volunteers like 'vol105' without writing complex joins and filters each time.


-- Question 5
SET SERVEROUTPUT ON

-- Create the procedure spDonorDetails
CREATE OR REPLACE PROCEDURE spDonorDetails (p_bike_id IN VARCHAR2) IS
    v_donor_name      VARCHAR2(40);
    v_contact_no      VARCHAR2(15);
    v_volunteer_fname VARCHAR2(20);
    v_donation_date   DATE;
    v_bike_desc       VARCHAR2(50);
    
BEGIN
    -- Retrieve the required donor, volunteer, and donation information
    SELECT d.DONOR_FNAME || ' ' || d.DONOR_LNAME,
           d.CONTACT_NO,
           v.VOL_FNAME,
           dn.DONATION_DATE,
           b.DESCRIPTION
    INTO v_donor_name, v_contact_no, v_volunteer_fname, v_donation_date, v_bike_desc
    FROM Donation dn
    JOIN Donor d ON dn.DONOR_ID = d.DONOR_ID
    JOIN Volunteer v ON dn.VOLUNTEER_ID = v.VOL_ID
    JOIN Bikes b ON dn.BIKE_ID = b.BIKE_ID
    WHERE dn.BIKE_ID = p_bike_id;
    
    -- Display the formatted output
    DBMS_OUTPUT.PUT_LINE('ATTENTION: ' || v_donor_name || 
                         ' assisted by: ' || v_volunteer_fname ||
                         ', donated the ' || v_bike_desc ||
                         ' on the ' || TO_CHAR(v_donation_date, 'DD/MON/YYYY'));

EXCEPTION
    -- Exception handling: In case no data is found for the provided bike ID
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No donation record found for Bike ID ' || p_bike_id);
    
    -- Exception handling: In case of any other unexpected errors
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred. Error Code: ' || SQLCODE || ' - ' || SQLERRM);

END spDonorDetails;
/

-- Execute the procedure for Bike ID 'B004'
BEGIN
    spDonorDetails('B004');
END;
/

-- Comments on the use of exception handling in this code:
-- 1. NO_DATA_FOUND: This exception handles cases where no donation record is found for the provided Bike ID. 
--    It ensures that an informative message is displayed instead of causing an unhandled error.
-- 2. OTHERS: This generic exception handles any unexpected errors that might occur during procedure execution. 
--    Displaying the error code and message helps identify the issue for debugging and error tracking.


-- Question 6
-- Enable output display in SQL*Plus
SET SERVEROUTPUT ON;

-- Create the function calculateTotalDonations
CREATE OR REPLACE FUNCTION calculateTotalDonations(p_donor_id IN VARCHAR2) RETURN NUMBER IS
    v_total_donations NUMBER := 0;
BEGIN
    -- Calculate total donations for the specified donor ID
    SELECT SUM(dn.DONATION_VALUE)
    INTO v_total_donations
    FROM Donation dn
    WHERE dn.DONOR_ID = p_donor_id;

    -- If the total is NULL, it means the donor has no donations
    IF v_total_donations IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('No donations found for Donor ID: ' || p_donor_id);
        RETURN 0;  -- Return 0 if no donations are found
    ELSE
        DBMS_OUTPUT.PUT_LINE('Total donations for Donor ID: ' || p_donor_id || ' is R ' || TO_CHAR(v_total_donations, '9,999.00'));
        RETURN v_total_donations;  -- Return the total donation amount
    END IF;

EXCEPTION
    -- Exception handling: Catch unexpected errors
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred. Error Code: ' || SQLCODE || ' - ' || SQLERRM);
        RETURN NULL;  -- Return NULL in case of an error
END calculateTotalDonations;
/

-- Execute the function for a specific donor ID
DECLARE
    v_total NUMBER;
BEGIN
    v_total := calculateTotalDonations('DID11');  -- Replace 'DID11' with any valid donor ID to test
    -- Optional: You can display the total if needed
    IF v_total IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Returned Total: R ' || TO_CHAR(v_total, '9,999.00'));
    END IF;
END;
/

-- Question 7
-- Enable output display in SQL*Plus
SET SERVEROUTPUT ON;

-- Generate the report for bike statuses
DECLARE
    v_status VARCHAR2(5);
    v_bike_value NUMBER;
BEGIN
    FOR bike_record IN (
        SELECT 
            b.BIKE_ID,
            b.BIKE_TYPE,
            b.MANUFACTURER,
            dn.DONATION_VALUE
        FROM 
            Bikes b
        JOIN 
            Donation dn ON b.BIKE_ID = dn.BIKE_ID
    ) LOOP
        -- Assign status based on donation value
        v_bike_value := bike_record.DONATION_VALUE;

        IF v_bike_value BETWEEN 0 AND 1500 THEN
            v_status := '*';  -- 1-star status
        ELSIF v_bike_value > 1500 AND v_bike_value <= 3000 THEN
            v_status := '**';  -- 2-star status
        ELSIF v_bike_value > 3000 THEN
            v_status := '***';  -- 3-star status
        END IF;

        -- Display the formatted output
        DBMS_OUTPUT.PUT_LINE('BIKE ID: ' || bike_record.BIKE_ID);
        DBMS_OUTPUT.PUT_LINE('BIKE TYPE: ' || bike_record.BIKE_TYPE);
        DBMS_OUTPUT.PUT_LINE('BIKE MANUFACTURER: ' || bike_record.MANUFACTURER);
        DBMS_OUTPUT.PUT_LINE('BIKE VALUE: ' || TO_CHAR(v_bike_value));
        DBMS_OUTPUT.PUT_LINE('STATUS: ' || v_status);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
EXCEPTION
    -- Exception handling: In case of any unexpected errors
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred. Error Code: ' || SQLCODE || ' - ' || SQLERRM);
END;
/

-- Question 8
-- Enable output display in SQL*Plus
SET SERVEROUTPUT ON;


-- Set line size and column formats for clean display in SQL*Plus
SET LINESIZE 200
COLUMN "BIKE ID" FORMAT A10
COLUMN "BIKE TYPE" FORMAT A15
COLUMN "MANUFACTURER" FORMAT A20
COLUMN "DONATION VALUE" FORMAT A15
COLUMN "STATUS" FORMAT A6;

-- Execute the query to display the results
SELECT 
    b.BIKE_ID,
    b.BIKE_TYPE,
    b.MANUFACTURER,
    TO_CHAR(dn.DONATION_VALUE) AS "VALUE",
    CASE 
        WHEN dn.DONATION_VALUE BETWEEN 0 AND 1500 THEN '*'
        WHEN dn.DONATION_VALUE > 1500 AND dn.DONATION_VALUE <= 3000 THEN '**'
        WHEN dn.DONATION_VALUE > 3000 THEN '***'
        ELSE 'N/A'  -- Default case if needed
    END AS STATUS
FROM 
    Bikes b
JOIN 
    Donation dn ON b.BIKE_ID = dn.BIKE_ID;


-- Question 9

-- Question 9.1
-- Create a trigger to prevent deletion from the Donation table
CREATE OR REPLACE TRIGGER prevent_donation_delete
BEFORE DELETE ON Donation
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Deletion of records from the Donation table is not allowed.');
END;
/

-- Attempt to delete a record from the Donation table
DELETE FROM Donation WHERE DONATION_ID = 1;  -- Replace with a valid donation ID

-- This will result in the trigger firing, and the output should be:
-- ORA-20001: Deletion of records from the Donation table is not allowed.


-- Question 9.2
-- Create a trigger to ensure valid bike value on update to the Donation table
CREATE OR REPLACE TRIGGER validate_donation_value
BEFORE UPDATE ON Donation
FOR EACH ROW
BEGIN
    -- Check if the new donation value is valid
    IF :NEW.DONATION_VALUE <= 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Invalid donation value: Must be greater than 0.');
    END IF;
END;
/
-- Attempt to update a record in the Donation table with an invalid value
UPDATE Donation 
SET DONATION_VALUE = -1000 
WHERE DONATION_ID = 1;  -- Replace with a valid donation ID

-- This will result in the trigger firing, and the output should be:
-- ORA-20002: Invalid donation value: Must be greater than 0.


