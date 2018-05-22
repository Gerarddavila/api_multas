const mysql = require('mysql');

var connection = mysql.createConnection({
  host: 'serverhost: db-apimultas.cadrtby0rver.us-west-2.rds.amazonaws.com',
    user: 'adminapi',
    password: 'Api2018Software',
    database: 'apimultas',
    port: '3306'
//  host: 'umgsm.com',
  //user: 'apimultas_user',
  //password: 'UserMultasDB2018',
  //database: 'apimultas',
  //port: '3306'
  //host     : 'localhost',
  //user     : 'root',
  //password : '',
  //database : 'db_api_multas'
});
connection.connect(function(err){
if(!err) {
    console.log("La base de datos está conectada");
} else {
    console.log("Error al conectarse con la base de datos");
}
});
exports.connection = connection;
//module.exports =connection;
