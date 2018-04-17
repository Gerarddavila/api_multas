const mysql = require('mysql');

var connection = mysql.createConnection({
  host: 'umgsm.com',
  user: 'apimultas_user',
  password: 'UserMultasDB2018',
  database: 'apimultas',
  port: '3306'
});

exports.connection = connection;
