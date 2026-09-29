# TRAIN-RESERVATION-SYSTEM
The Train Reservation System is a Python-based application designed to simulate the process of booking train tickets. It provides users with an interactive interface to search available trains, reserve seats, cancel bookings, and view passenger details. 
# TRAIN-RESERVATION-SYSTEM
Python-based Railway Reservation System using MySQL for train management, ticket reservation, cancellation, and PNR status tracking.
# 🚆 Railway Reservation System

A simple **Railway Reservation System** developed using **Python and MySQL**. The project provides a command-line interface for managing train details, reserving tickets, cancelling tickets, and checking passenger/PNR status.

## 📌 Features

* 🚆 View available train details
* 🎫 Reserve a railway ticket
* ❌ Cancel a reserved ticket
* 🔎 Check PNR/reservation status
* ➕ Add new train details to the database
* 💾 Store passenger and train information using MySQL
* 🔄 Update reservation status in the database

## 🛠️ Technologies Used

* **Python 3**
* **MySQL**
* **mysql-connector-python**
* **Command Line Interface (CLI)**

## 📂 Project Structure

```text
Railway-Reservation-System/
│
├── railway_reservation.py
└── README.md
```

> The Python filename can be changed according to the name of your actual `.py` file.

## 🗄️ Database

The project uses a MySQL database named:

```text
train
```

### Train Details Table

The `train_detail` table stores information such as:

* Train Number
* Train Cost
* Starting Point
* Destination
* Route/Via
* Departure Time
* Available Date

### User Information Table

The `user_information` table stores passenger information such as:

* Unique ID
* Passenger Name
* Age
* Gender
* Train Number
* Starting Point
* Destination
* Reservation Status

## ⚙️ Installation

### 1. Install Python

Download and install Python from the official Python website.

### 2. Install MySQL

Install MySQL Server and MySQL Workbench on your computer.

### 3. Install MySQL Connector

Open Command Prompt/Terminal and run:

```bash
pip install mysql-connector-python
```

### 4. Create the Database

Open MySQL and create the database:

```sql
CREATE DATABASE train;
```

Then select it:

```sql
USE train;
```

Create the required tables according to the fields used in the Python program.

## 🔧 MySQL Connection

The Python program connects to MySQL using:

```python
import mysql.connector as ch

conn = ch.connect(
    host="localhost",
    user="root",
    passwd="1234",
    database="train"
)
```

### Important

Change the MySQL password in the Python file according to your own MySQL setup.

For example:

```python
passwd="YOUR_MYSQL_PASSWORD"
```

Do **not** upload your real database password to a public GitHub repository.

## ▶️ How to Run

Clone the repository:

```bash
git clone https://github.com/YOUR-USERNAME/Railway-Reservation-System.git
```

Go to the project directory:

```bash
cd Railway-Reservation-System
```

Run the Python program:

```bash
python railway_reservation.py
```

## 🖥️ Main Menu

When the program starts, it displays:

```text
Railway Reservation
1. Train Detail
2. Reservation of Ticket
3. Cancellation of Ticket
4. Display PNR status
5. Quit
6. For adding in train detail
```

### 1. Train Detail

The user enters the starting point and destination. The program searches the MySQL database and displays matching trains along with their:

* Train number
* Cost
* Route
* Departure time
* Available date

### 2. Reservation of Ticket

The passenger enters:

* Name
* Age
* Gender
* Train number

The program retrieves the train's starting point, destination, and cost from MySQL. The passenger can then confirm the reservation.

A unique ID is generated for identifying the passenger's booking.

### 3. Cancellation of Ticket

The passenger enters the unique ID provided during reservation. The system updates the reservation status to:

```text
not reserved
```

### 4. Display PNR Status

The passenger can enter their unique ID to retrieve their stored passenger information and current reservation status.

### 5. Quit

Terminates the menu operation.

### 6. Add Train Details

New train information can be inserted into the `train_detail` table, including train number, cost, source, destination, route, departure time, and date.

## 🔄 Project Workflow

```text
             ┌──────────────────┐
             │   Start Program  │
             └────────┬─────────┘
                      ↓
             ┌──────────────────┐
             │    Main Menu     │
             └────────┬─────────┘
                      ↓
       ┌──────────────┼──────────────┐
       ↓              ↓              ↓
 Train Details   Reservation     Cancellation
       │              │              │
       ↓              ↓              ↓
    MySQL          MySQL           MySQL
    Search        Insert/Update     Update
       │              │              │
       └──────────────┼──────────────┘
                      ↓
                PNR Status
                      ↓
                 Main Menu
```

## 🎯 Project Objectives

The main objectives of this project are:

1. To develop a basic railway reservation system using Python.
2. To understand database connectivity using MySQL.
3. To perform SQL operations through Python.
4. To store and retrieve passenger information.
5. To implement basic reservation and cancellation functionality.
6. To understand CRUD operations in a real-world application.

## 📚 Concepts Demonstrated

This project demonstrates several programming and database concepts:

* Python functions
* Conditional statements
* Loops
* Lists
* User input
* MySQL connectivity
* SQL `SELECT`
* SQL `INSERT`
* SQL `UPDATE`
* Database transactions
* Exception-free basic database operations
* Menu-driven programming

## 🚀 Future Improvements

The project can be further improved by adding:

* Automatic PNR generation
* Proper seat availability management
* Date-wise train search
* Login and authentication
* Admin and passenger accounts
* Password protection
* Better input validation
* Graphical User Interface (GUI)
* Ticket/receipt generation
* Email or SMS confirmation
* Proper database relationships and foreign keys

## ⚠️ Limitations

This is a basic educational project and does not implement a complete real-world railway reservation system.

Some limitations include:

* Basic command-line interface
* Limited input validation
* No actual seat allocation system
* No user authentication
* No automatic PNR generation
* Reservation status is handled using database updates
* Database credentials are currently configured directly in the Python code

## 👨‍💻 Author

**Sakshi Mishra**

Computer Science and Engineering Student
VIT Bhopal University

## 📄 License

This project is created for educational and learning purposes.
