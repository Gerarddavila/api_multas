const mysql = require('mysql');

var connection = mysql.createConnection({
    host:'apimultas2.cadrtby0rver.us-west-2.rds.amazonaws.com',
    user:'adminapi',
    password:'Api2018Software',
    database:'apimultas',
    port: '3306'
});
connection.connect(function(err){
if(!err) {
    console.log("La base de datos está conectada");
} else {
    console.log("Error al conectarse con la base de datos");
}
});
exports.connection = connection;
