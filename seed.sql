// Import the mysql library
const mysql = require('mysql');

// Create a connection to the MySQL database
const connection = mysql.createConnection({
  host: 'localhost', // Change this to your MySQL server host
  user: 'your_username', // Change this to your MySQL username
  password: 'your_password', // Change this to your MySQL password
  database: 'workDB' // Change this to the name of your MySQL database
});

// Connect to the database
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to database: ' + err.stack);
    return;
  }
  console.log('Connected to database as ID ' + connection.threadId);
});

// Execute SQL queries to populate the database
connection.query(`
  INSERT INTO department (name) VALUES ("Sales");
  INSERT INTO department (name) VALUES ("Engineering");
  INSERT INTO department (name) VALUES ("Finance");
  INSERT INTO department (name) VALUES ("Legal");

  INSERT INTO role (title, salary, department_id) VALUES ("Salesman", 100000, 1);
  INSERT INTO role (title, salary, department_id) VALUES ("Engineer", 150000, 2);
  INSERT INTO role (title, salary, department_id) VALUES ("Financial Analyst", 120000, 3);
  INSERT INTO role (title, salary, department_id) VALUES ("Accountant", 125000, 3);
  INSERT INTO role (title, salary, department_id) VALUES ("Lawyer", 250000, 4);

  INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Adam", "Tatar", 1, 3);
  INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Ryan", "Doob", 2, 1);
  INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Dylan", "Scamuel", 3, null);
  INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Big", "Corbs", 4, 3);
  INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Mikey", "Likey", 5, null);
  INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("The", "Bossman", 2, null);
  INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Tay", "Jack", 4, 7);
  INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ("Jackie", "Moonlight", 1, 2);
`, (err, results, fields) => {
  if (err) {
    console.error('Error executing SQL queries: ' + err.stack);
    return;
  }
  console.log('Sample data inserted successfully');
});

// Close the connection
connection.end();
