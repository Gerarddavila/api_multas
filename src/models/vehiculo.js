const mysql = require('mysql');

connection = mysql.createConnection({
  host: 'apimult.heliohost.org',
  user: 'apimult_user',
  password: 'UsuarioBD2018',
  database: 'apimult_as',
  port: '3306'
});

let vehiculoModel = {};

vehiculoModel.getVehiculo = (callback) => {
  if (connection) {
    connection.query('SELECT * FROM datos_vehiculo ORDER BY id',
    (err, rows) => {
      if (err) {
        throw err;
      }else {
        callback(null, rows);
      }
    }
  )
  }
};

vehiculoModel.insertVehiculo = (vehiculoData, callback) => {
  if (connection){
    connection.query('INSERT INTO datos_vehiculo SET ?', vehiculoData,
(err, result) => {
  if (err)
  {
    throw err;
  }
  else {
    callback(null, {'insertId': result.insertId})

  }
}
  )
  }
};

vehiculoModel.updateVehiculo = (vehiculoData, callback) => {
  if (connection) {
const sql = `UPDATE datos_vehiculo SET
no_placa = ${connection.escape(vehiculoData.no_placa)},
no_multa = ${connection.escape(vehiculoData.no_multa)},
no_tarjeta_cir = ${connection.escape(vehiculoData.no_tarjeta_cir)},
tipo_vehiculo = ${connection.escape(vehiculoData.tipo_vehiculo)},
marca = ${connection.escape(vehiculoData.marca)},
color = ${connection.escape(vehiculoData.color)}
WHERE id= ${connection.escape(vehiculoData.id)} `
connection.query(sql, (err, result) => {
  if (err)
  {
    throw err;
  }else {
    callback(null, {
      "msg": "Satisfactorio"
    });
  }
})

  }
};


vehiculoModel.deleteVehiculo = (id, callback)=>{
  if (connection) {
    let sql = `SELECT * FROM datos_vehiculo WHERE id = ${connection.escape(id)}`;
    connection.query(sql, (err, row)=> {
      if (row) {
        let sql = `DELETE FROM datos_vehiculo WHERE id = ${id}`;
        connection.query(sql, (err, result) => {
if (err) {
  throw err;
}else {
  callback (null,{
    msg: 'Eliminado'
  })
}

        })
      }else {
        callback (null,{
          msg: 'No Existe'
        })

      }
    });
  }
};

module.exports = vehiculoModel;
