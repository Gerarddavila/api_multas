const mysql = require('mysql');

connection = mysql.createConnection({
  host: 'apimult.heliohost.org',
  user: 'apimult_user',
  password: 'UsuarioBD2018',
  database: 'apimult_as',
  port: '3306'
});

let agenteModel = {};

agenteModel.getAgente = (callback) => {
  if (connection) {
    connection.query('SELECT * FROM datos_agente ORDER BY id',
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

agenteModel.insertAgente = (agenteData, callback) => {
  if (connection){
    connection.query('INSERT INTO datos_agente SET ?', agenteData,
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

agenteModel.updateAgente = (agenteData, callback) => {
  if (connection) {
const sql = `UPDATE datos_agente SET
no_identificacion = ${connection.escape(agenteData.no_identificacion)},
firmo_agente = ${connection.escape(agenteData.firmo_agente)},
firmo_infractor = ${connection.escape(agenteData.firmo_infractor)},
nego_firmar_infractor = ${connection.escape(agenteData.nego_firmar_infractor)},
datos_vehiculo_id = ${connection.escape(agenteData.datos_vehiculo_id)},
articulo_infringido_id = ${connection.escape(agenteData.articulo_infringido_id)},
datos_infraccion_id = ${connection.escape(agenteData.datos_infraccion_id)}
WHERE id= ${connection.escape(agenteData.id)}
`
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


agenteModel.deleteAgente = (id, callback)=>{
  if (connection) {
    let sql = `SELECT * FROM datos_agente WHERE id = ${connection.escape(id)}`;
    connection.query(sql, (err, row)=> {
      if (row) {
        let sql = `DELETE FROM datos_agente WHERE id = ${id}`;
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

module.exports = agenteModel;
