const mysql = require('mysql');


var connection = mysql.createConnection({
    host:'nombre_base_de_datos',
    user:'usuario_base_de_datos',
    password:'password_base_de_datos',
    database:'apimultas2',
    port: '3306'
});
connection.connect(function(err){
if(!err) {
    console.log("La base de datos está conectada: apimultas2");
} else {
    console.log("Error al conectarse con la base de datos: apimultas2");
}
});
exports.connection = connection;
