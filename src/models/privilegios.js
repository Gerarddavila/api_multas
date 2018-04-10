const mysql = require('mysql');

connection = mysql.createConnection({
  host: 'apimult.heliohost.org',
  user: 'apimult_user',
  password: 'UsuarioBD2018',
  database: 'apimult_as',
  port: '3306'
});

let privilegiosModel = {};

privilegiosModel.getPrivilegios = (callback) => {
  if (connection) {
    connection.query('SELECT * FROM privilegios ORDER BY id',
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

privilegiosModel.insertPrivilegios = (privilegiosData, callback) => {
  if (connection){
    connection.query('INSERT INTO privilegios SET ?', privilegiosData,
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

privilegiosModel.updatePrivilegios = (privilegiosData, callback) => {
  if (connection) {
const sql = `UPDATE privilegios SET
privilegio = ${connection.escape(privilegiosData.privilegio)}
WHERE id= ${connection.escape(privilegiosData.id)}
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


privilegiosModel.deletePrivilegios = (id, callback)=>{
  if (connection) {
    let sql = `SELECT * FROM privilegios WHERE id = ${connection.escape(id)}`;
    connection.query(sql, (err, row)=> {
      if (row) {
        let sql = `DELETE FROM privilegios WHERE id = ${id}`;
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

module.exports = privilegiosModel;
