Clone this repository to your local machine:

bash

git clone <repository-url>

Navigate to the project directory:

bash

cd employee-tracker

Install dependencies:

    npm install

    Set up your MySQL database:
        Create a MySQL database using the provided schema.sql file.
        Optionally, populate the database with sample data using the seeds.sql file.

    Configure database connection:
        Open the db.js file and update the connection parameters (host, port, user, password, database) to match your MySQL configuration.

Usage

To start the application, run the following command:

node app.js

Follow the prompts to perform various actions such as adding new employees, viewing employee information, updating employee roles, and deleting employees.
Dependencies

    MySQL - A MySQL client for Node.js.
    Inquirer - A collection of common interactive command-line user interfaces.
