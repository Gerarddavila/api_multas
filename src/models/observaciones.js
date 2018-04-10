const mysql = require('mysql');

connection = mysql.createConnection({
  host: 'apimult.heliohost.org',
  user: 'apimult_user',
  password: 'UsuarioBD2018',
  database: 'apimult_as',
  port: '3306'
});

let observacionesModel = {};

observacionesModel.getObservaciones = (callback) => {
  if (connection) {
    connection.query('SELECT * FROM observaciones ORDER BY id',
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

observacionesModel.insertObservaciones = (observacionesData, callback) => {
  if (connection){
    connection.query('INSERT INTO observaciones SET ?', observacionesData,
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

observacionesModel.updateObservaciones = (observacionesData, callback) => {
  if (connection) {
const sql = `UPDATE observaciones SET
observacion = ${connection.escape(observacionesData.observacion)},
datos_agente_id = ${connection.escape(observacionesData.datos_agente_id)}
WHERE id= ${connection.escape(observacionesData.id)}
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


observacionesModel.deleteObservaciones = (id, callback)=>{
  if (connection) {
    let sql = `SELECT * FROM observaciones WHERE id = ${connection.escape(id)}`;
    connection.query(sql, (err, row)=> {
      if (row) {
        let sql = `DELETE FROM observaciones WHERE id = ${id}`;
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

module.exports = observacionesModel;
