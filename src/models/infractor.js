const mysql = require('mysql');

connection = mysql.createConnection({
  host: 'apimult.heliohost.org',
  user: 'apimult_user',
  password: 'UsuarioBD2018',
  database: 'apimult_as',
  //port: '3306'
});

let infractorModel = {};

infractorModel.getInfractor = (callback) => {
  if (connection) {
    connection.query('SELECT * FROM datos_infractor ORDER BY id',
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

infractorModel.insertInfractor = (infractorData, callback) => {
  if (connection){
    connection.query('INSERT INTO datos_infractor SET ?', infractorData,
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

infractorModel.updateInfractor = (infractorData, callback) => {
  if (connection) {
const sql = `UPDATE datos_infractor SET
nombres = ${connection.escape(infractorData.nombres)},
apellidos = ${connection.escape(infractorData.apellidos)},
conductor_ausente = ${connection.escape(infractorData.conductor_ausente)},
genero = ${connection.escape(infractorData.genero)},
no_licencia = ${connection.escape(infractorData.no_licencia)},
tipo_licencia = ${connection.escape(infractorData.tipo_licencia)},
no_documento_dpi = ${connection.escape(infractorData.no_documento_dpi)},
domicilio = ${connection.escape(infractorData.domicilio)},
datos_vehiculo_id = ${connection.escape(infractorData.datos_vehiculo_id)}
WHERE id= ${connection.escape(infractorData.id)}
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


infractorModel.deleteInfractor = (id, callback)=>{
  if (connection) {
    let sql = `SELECT * FROM datos_infractor WHERE id = ${connection.escape(id)}`;
    connection.query(sql, (err, row)=> {
      if (row) {
        let sql = `DELETE FROM datos_infractor WHERE id = ${id}`;
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

module.exports = infractorModel;
