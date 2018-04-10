const mysql = require('mysql');

connection = mysql.createConnection({
  host: 'apimult.heliohost.org',
  user: 'apimult_user',
  password: 'UsuarioBD2018',
  database: 'apimult_as',
  port: '3306'
});

let credencialesModel = {};

credencialesModel.getCredenciales = (callback) => {
  if (connection) {
    connection.query('SELECT * FROM credenciales ORDER BY id',
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

credencialesModel.insertCredenciales = (credencialesData, callback) => {
  if (connection){
    connection.query('INSERT INTO credenciales SET ?', credencialesData,
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

credencialesModel.updateCredenciales = (credencialesData, callback) => {
  if (connection) {
const sql = `UPDATE credenciales SET
usuario = ${connection.escape(credencialesData.usuario)},
password = ${connection.escape(credencialesData.password)},
privilegios_id = ${connection.escape(credencialesData.privilegios_id)}
WHERE id= ${connection.escape(credencialesData.id)}
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


credencialesModel.deleteCredenciales = (id, callback)=>{
  if (connection) {
    let sql = `SELECT * FROM credenciales WHERE id = ${connection.escape(id)}`;
    connection.query(sql, (err, row)=> {
      if (row) {
        let sql = `DELETE FROM credenciales WHERE id = ${id}`;
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

module.exports = credencialesModel;
