const mysql = require ('mysql');
connection = mysql.createConnection({
host: 'apimult.heliohost.org',
user: 'apimult_user',
password: 'UsuarioBD2018',
database: 'apimult_as',
port:'3306'


});
let infraccionModel = {};
infraccionModel.getInfraccion = (callback) => {

  if (connection)
  {
    connection.query ('SELECT *  FROM datos_infraccion ORDER BY id',
  (err,rows) => {
if (err) {
throw err;

}
else {
  callback(null, rows);
}

  }
)
  }
};
infraccionModel.insertInfraccion = (infraccionData, callback) => {
  if (connection){
    connection.query('INSERT INTO datos_infraccion SET ?', infraccionData,
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

infraccionModel.updateInfraccion = (infraccionData, callback) => {
  if (connection) {
const sql = `UPDATE datos_infraccion SET
lugar_infraccion = ${connection.escape(infraccionData.lugar_infraccion)},
fecha_infraccion = ${connection.escape(infraccionData.fecha_infraccion)},
hora_infraccion = ${connection.escape(infraccionData.hora_infraccion)},
datos_vehiculo_id = ${connection.escape(infraccionData.datos_vehiculo_id)}
WHERE id= ${connection.escape(infraccionData.id)}
`
connection.query(sql, (err, result) => {
  if (err)
  {
    throw err;
  }else {
    callback(null, {
      "msg": "success"
    });
  }
})

  }
};


infraccionModel.deleteInfraccion = (id, callback)=>{
  if (connection) {
    let sql = `SELECT * FROM datos_infraccion WHERE id = ${connection.escape(id)}`;
    connection.query(sql, (err, row)=> {
      if (row) {
        let sql = `DELETE FROM datos_infraccion WHERE id = ${id}`;
        connection.query(sql, (err, result) => {
if (err) {
  throw err;
}else {
  callback (null,{
    msg: 'deleted'
  })
}

        })
      }else {
        callback (null,{
          msg: 'Not exists'
        })

      }
    });
  }
};
module.exports = infraccionModel;
