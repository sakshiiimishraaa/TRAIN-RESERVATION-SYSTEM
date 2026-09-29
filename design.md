# 🚆 Railway Reservation System — Design Document

## 1. Overview

The **Railway Reservation System** is a command-line-based application developed using **Python** and **MySQL**. The system is designed to manage train information and basic passenger ticket operations.

The application uses Python for the user interface and program logic, while MySQL is used to store and manage train and passenger information.

---

## 2. System Architecture

The project follows a simple three-layer structure:

```text
┌──────────────────────────────┐
│       User / Passenger       │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│       Python Application     │
│                              │
│  • Main Menu                 │
│  • Train Search              │
│  • Reservation               │
│  • Cancellation              │
│  • PNR Status                │
│  • Train Management          │
└──────────────┬───────────────┘
               │
               │ MySQL Connector
               ▼
┌──────────────────────────────┐
│        MySQL Database        │
│                              │
│  • train_detail              │
│  • user_information          │
└──────────────────────────────┘
```

---

## 3. Technology Stack

| Component            | Technology                   |
| -------------------- | ---------------------------- |
| Programming Language | Python                       |
| Database             | MySQL                        |
| Database Connector   | mysql-connector-python       |
| Interface            | Command Line Interface (CLI) |
| Database Operations  | SQL                          |
| Version Control      | Git / GitHub                 |

---

## 4. Main Modules

### 4.1 Main Menu

The `railsmenu()` function acts as the central controller of the application.

It provides the following options:

```text
1. Train Detail
2. Reservation of Ticket
3. Cancellation of Ticket
4. Display PNR Status
5. Quit
6. Add Train Details
```

Based on the user's choice, the appropriate function is called.

---

### 4.2 Train Search Module

The `train_detail()` function allows users to search for trains.

### Input

* Starting point
* Destination

### Process

The application executes a SQL `SELECT` query to find trains matching the entered source and destination.

### Output

The system displays:

* Train number
* Cost
* Route/Via
* Departure time
* Available date

---

### 4.3 Reservation Module

The `reservation()` function handles ticket reservations.

### Input

* Passenger name
* Age
* Gender
* Train number

### Process

1. Generate a unique passenger ID.
2. Retrieve the train's starting point and destination.
3. Store passenger information in MySQL.
4. Retrieve the ticket cost.
5. Ask the passenger to confirm the reservation.
6. Update the reservation status.

### Reservation Status

```text
reserved
not reserved
```

---

### 4.4 Cancellation Module

The `cancel()` function handles ticket cancellation.

### Input

* Passenger unique ID

### Process

The application searches for the passenger using the unique ID and updates the reservation status to:

```text
not reserved
```

---

### 4.5 PNR Status Module

The `displayPNR()` function allows the passenger to check their reservation information.

### Input

* Unique ID

### Process

The application retrieves the passenger record from the `user_information` table.

### Output

The stored passenger information and reservation status are displayed.

---

### 4.6 Train Management Module

The `train()` function is used to add new train records.

### Input

* Train number
* Train cost
* Starting point
* Destination
* Via/route
* Departure time
* Available date

The information is inserted into the `train_detail` table using an SQL `INSERT` query.

---

# 5. Database Design

The application uses a MySQL database named:

```text
train
```

The database contains two main tables.

---

## 5.1 `train_detail`

This table stores information about available trains.

| Field               | Description           |
| ------------------- | --------------------- |
| `train_no`          | Unique train number   |
| `cost`              | Ticket cost           |
| `starting_point`    | Starting station      |
| `destination`       | Destination station   |
| `via`               | Route information     |
| `time_of_departure` | Train departure time  |
| `date_available`    | Available travel date |

### Example

```text
train_no | cost | starting_point | destination | via | time | date
---------|------|----------------|-------------|-----|------|------
10101    | 850  | Delhi          | Bhopal      | Agra| 18:30| 10-10-2026
```

---

## 5.2 `user_information`

This table stores passenger reservation information.

| Field            | Description                         |
| ---------------- | ----------------------------------- |
| `unique_id`      | Unique passenger/booking identifier |
| `uname`          | Passenger name                      |
| `age`            | Passenger age                       |
| `gender`         | Passenger gender                    |
| `train_no`       | Selected train                      |
| `starting_point` | Journey starting point              |
| `destination`    | Journey destination                 |
| `reservation`    | Current reservation status          |

### Example

```text
unique_id | uname  | age | gender | train_no | starting_point | destination | reservation
----------|--------|-----|--------|----------|----------------|-------------|------------
0         | Rahul  | 20  | M      | 10101    | Delhi          | Bhopal      | reserved
```

---

# 6. Data Flow

## Train Search

```text
User
  │
  ├── Starting Point
  └── Destination
          │
          ▼
   Python Program
          │
          ▼
      MySQL Query
          │
          ▼
    train_detail Table
          │
          ▼
   Matching Train Details
```

## Ticket Reservation

```text
Passenger Details
       │
       ▼
Python Program
       │
       ▼
Find Train Information
       │
       ▼
Insert Passenger Record
       │
       ▼
Ask for Confirmation
       │
       ▼
Update Reservation Status
       │
       ▼
     MySQL
```

## Ticket Cancellation

```text
Unique ID
    │
    ▼
Python Program
    │
    ▼
Search Passenger
    │
    ▼
Update Reservation
    │
    ▼
"not reserved"
```

---

# 7. Program Flow

```text
                 START
                   │
                   ▼
              Main Menu
                   │
       ┌───────────┼────────────┐
       │           │            │
       ▼           ▼            ▼
 Train Detail  Reservation  Cancellation
       │           │            │
       ▼           ▼            ▼
     Search      Book         Cancel
       │           │            │
       └───────────┼────────────┘
                   │
                   ▼
              PNR Status
                   │
                   ▼
              Main Menu
                   │
                   ▼
                  EXIT
```

---

# 8. SQL Operations

The project uses basic SQL operations through Python.

### SELECT

Used to retrieve train and passenger information.

```sql
SELECT train_no, cost, via, time_of_departure, date_available
FROM train_detail
WHERE starting_point = %s AND destination = %s;
```

### INSERT

Used to add passenger and train information.

```sql
INSERT INTO user_information
(unique_id, uname, age, gender, train_no, starting_point, destination)
VALUES (%s, %s, %s, %s, %s, %s, %s);
```

### UPDATE

Used to change reservation status.

```sql
UPDATE user_information
SET reservation = %s
WHERE unique_id = %s;
```

---

# 9. Python–MySQL Connection

The application establishes a connection using `mysql.connector`.

```python
import mysql.connector as ch

conn = ch.connect(
    host="localhost",
    user="root",
    passwd="YOUR_MYSQL_PASSWORD",
    database="train"
)

cur = conn.cursor()
```

The cursor is used to execute SQL queries, while `conn.commit()` saves changes made to the database.

---

# 10. Design Principles

The project follows these basic design principles:

* **Modularity:** Different operations are separated into functions.
* **Database Integration:** Passenger and train information is stored in MySQL.
* **Menu-Driven Interface:** Users interact with the application through a simple CLI.
* **Data Persistence:** Information remains stored in the database after the program ends.
* **Simple User Interaction:** The system uses straightforward inputs and outputs.
* **SQL-Based Data Management:** Database operations are performed using SQL queries.

---

# 11. Error Handling Considerations

The current version is designed as an educational project and contains basic input handling.

Potential errors include:

* Invalid menu choices
* Invalid age or train number input
* Searching for a non-existent train
* Entering an invalid unique ID
* MySQL connection errors
* Incorrect database credentials

Future versions can include proper exception handling using Python's `try-except` mechanism.

---

# 12. Security Considerations

Database credentials should not be exposed in a public GitHub repository.

Instead of storing an actual password directly in the source code:

```python
passwd="1234"
```

use:

```python
passwd="YOUR_MYSQL_PASSWORD"
```

For a production application, credential
