const mysql = require('mysql');

var connection = mysql.createConnection({
    host:'nombre_base_de_datos',
    user:'usuario_base_de_datos',
    password:'password_base_de_datos',
    database:'apimultas',
    port: '3306'
});
connection.connect(function(err){
if(!err) {
    console.log("La base de datos está conectada: apimultas");
} else {
    console.log("Error al conectarse con la base de datos: apimultas");
}
});
exports.connection = connection;
