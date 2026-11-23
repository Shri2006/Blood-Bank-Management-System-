-- Blood Bank Management System: relational database starter schema
-- Use synthetic data only. Adapt constraints and access controls before real deployment.
CREATE DATABASE IF NOT EXISTS blood_bank_db;
USE blood_bank_db;

CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(15) NOT NULL UNIQUE,
  role ENUM('Admin','Staff','Donor','Requester') NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Donors (
  donor_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL UNIQUE,
  blood_group ENUM('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  availability BOOLEAN NOT NULL DEFAULT TRUE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Donation_Records (
  donation_id INT AUTO_INCREMENT PRIMARY KEY,
  donor_id INT NOT NULL,
  donation_date DATE NOT NULL,
  center_id VARCHAR(40),
  screening_status ENUM('Pending','Passed','Deferred','Rejected') NOT NULL DEFAULT 'Pending',
  FOREIGN KEY (donor_id) REFERENCES Donors(donor_id)
);
CREATE TABLE Blood_Units (
  unit_id INT AUTO_INCREMENT PRIMARY KEY,
  donation_id INT NOT NULL,
  blood_group ENUM('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  component_type ENUM('Whole Blood','Red Blood Cells','Plasma','Platelets') NOT NULL,
  status ENUM('Collected','Testing','Available','Reserved','Dispatched','Expired') NOT NULL DEFAULT 'Collected',
  expiry_date DATE,
  FOREIGN KEY (donation_id) REFERENCES Donation_Records(donation_id),
  INDEX idx_inventory_lookup (blood_group, component_type, status, expiry_date)
);
CREATE TABLE Blood_Requests (
  request_id INT AUTO_INCREMENT PRIMARY KEY,
  requester_user_id INT,
  recipient_label VARCHAR(120) NOT NULL,
  blood_group ENUM('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  component_type ENUM('Whole Blood','Red Blood Cells','Plasma','Platelets') NOT NULL,
  units_needed INT NOT NULL CHECK (units_needed > 0),
  urgency ENUM('Normal','High','Emergency') NOT NULL DEFAULT 'Normal',
  status ENUM('Pending','Under review','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (requester_user_id) REFERENCES Users(user_id)
);
