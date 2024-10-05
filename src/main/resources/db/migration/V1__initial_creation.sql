-- Create patients table
CREATE TABLE IF NOT EXISTS patients (
                                        id SERIAL PRIMARY KEY,
                                        first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- Create doctors table
CREATE TABLE IF NOT EXISTS doctors (
                                       id SERIAL PRIMARY KEY,
                                       first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- Create appointments table
CREATE TABLE IF NOT EXISTS appointments (
                                            id SERIAL PRIMARY KEY,
                                            patient_id INT NOT NULL,
                                            doctor_id INT NOT NULL,
                                            appointment_date TIMESTAMP NOT NULL,
                                            reason TEXT,
                                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                            FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE
    );

-- Create medications table
CREATE TABLE IF NOT EXISTS medications (
                                           id SERIAL PRIMARY KEY,
                                           name VARCHAR(100) NOT NULL,
    dosage VARCHAR(100),
    frequency VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- Create prescriptions table
CREATE TABLE IF NOT EXISTS prescriptions (
                                             id SERIAL PRIMARY KEY,
                                             patient_id INT NOT NULL,
                                             doctor_id INT NOT NULL,
                                             medication_id INT NOT NULL,
                                             date_prescribed TIMESTAMP NOT NULL,
                                             instructions TEXT,
                                             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                             updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                             FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE,
    FOREIGN KEY (medication_id) REFERENCES medications(id) ON DELETE CASCADE
    );
