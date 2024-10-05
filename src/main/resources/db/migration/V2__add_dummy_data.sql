-- Insert dummy data into patients table
INSERT INTO patients (name, email, phone_number) VALUES
                                                     ('John Doe', 'john.doe@example.com', '123-456-7890'),
                                                     ('Jane Smith', 'jane.smith@example.com', '987-654-3210');

-- Insert dummy data into doctors table
INSERT INTO doctors (name, specialty) VALUES
                                          ('Dr. Alice Johnson', 'Cardiology'),
                                          ('Dr. Bob Brown', 'Pediatrics');

-- Insert dummy data into medications table
INSERT INTO medications (name, dosage, frequency) VALUES
                                                      ('Aspirin', '100mg', 'Once a day'),
                                                      ('Amoxicillin', '500mg', 'Twice a day');

-- Insert dummy data into prescriptions table
INSERT INTO prescriptions (medication, dosage, patient_id, doctor_id) VALUES
                                                                          ('Aspirin', '100mg', (SELECT id FROM patients WHERE name = 'John Doe'), (SELECT id FROM doctors WHERE name = 'Dr. Alice Johnson')),
                                                                          ('Amoxicillin', '500mg', (SELECT id FROM patients WHERE name = 'Jane Smith'), (SELECT id FROM doctors WHERE name = 'Dr. Bob Brown'));

-- Insert dummy data into appointments table
INSERT INTO appointments (appointment_date, patient_id, doctor_id) VALUES
                                                                       ('2024-10-15 10:00:00', (SELECT id FROM patients WHERE name = 'John Doe'), (SELECT id FROM doctors WHERE name = 'Dr. Alice Johnson')),
                                                                       ('2024-10-16 11:00:00', (SELECT id FROM patients WHERE name = 'Jane Smith'), (SELECT id FROM doctors WHERE name = 'Dr. Bob Brown'));
