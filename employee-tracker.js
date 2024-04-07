const mysql = require('mysql');
const inquirer = require("inquirer");
const table = require("console.table");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "takecare1",
    database: "workdb"
});

// Connect to the MySQL database
connection.connect(function (err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId + "\n");
    askQuestions(); // Call the function to start prompting questions
});

// Function to prompt questions to the user
function askQuestions() {
    inquirer.prompt({
        message: "what would you like to do?",
        type: "list",
        choices: [
            "view all employees",
            "view all departments",
            "add employee",
            "add department",
            "add role",
            "update employee role",
            "QUIT"
        ],
        name: "choice"
    }).then(answers => {
        console.log(answers.choice); // Log the user's choice
        switch (answers.choice) {
            case "view all employees":
                viewEmployees(); // Call the function to view all employees
                break;

            case "view all departments":
                viewDepartments(); // Call the function to view all departments
                break;

            case "add employee":
                addEmployee(); // Call the function to add an employee
                break;

            case "add department":
                addDepartment(); // Call the function to add a department
                break;

            case "add role":
                addRole(); // Call the function to add a role
                break;

            case "update employee role":
                updateEmployeeRole(); // Call the function to update an employee's role
                break;

            default:
                connection.end(); // End the database connection
                break;
        }
    })
}

// Function to view all employees
function viewEmployees() {
    connection.query("SELECT * FROM employee", function (err, data) {
        console.table(data); // Display the employee data in a table
        askQuestions(); // Prompt questions again
    })
}

// Function to view all departments
function viewDepartments() {
    connection.query("SELECT * FROM department", function (err, data) {
        console.table(data); // Display the department data in a table
        askQuestions(); // Prompt questions again
    })
}

// Function to add an employee
function addEmployee() {
    inquirer.prompt([
        {
            type: "input",
            name: "firstName",
            message: "What is the employee's first name?"
        },
        {
            type: "input",
            name: "lastName",
            message: "What is the employee's last name?"
        },
        {
            type: "number",
            name: "roleId",
            message: "What is the employee's role ID?"
        },
        {
            type: "number",
            name: "managerId",
            message: "What is the employee's manager's ID?"
        }
    ]).then(function (res) {
        connection.query('INSERT INTO employee (first_name, last_n
