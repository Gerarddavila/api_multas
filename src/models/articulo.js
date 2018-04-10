//--------------------Configuracion de la conexion--------------------------------
const mysql = require ('mysql');
connection = mysql.createConnection({
host: 'apimult.heliohost.org',
user: 'apimult_user',
password: 'UsuarioBD2018',
database: 'apimult_as',
port:'3306'
});
//--------------------Metodo para obtener datos --------------------------------
let ArticuloModel = {};
ArticuloModel.getArticulo = (callback) => {

  if (connection)
  {
    connection.query ('SELECT *  FROM articulo_infringido',
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
//-----------------Metodo para enviar datos-------------------------------------
ArticuloModel.insertArticulo = (ArticuloData, callback) => {
  if (connection){
    connection.query('INSERT INTO articulo_infringido SET ?', ArticuloData,
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
//------------------Metodo para actualiar datos---------------------------------
ArticuloModel.updateArticulo = (ArticuloData, callback) => {
  if (connection) {
const sql = `UPDATE articulo_infringido SET
no_articulo = ${connection.escape(ArticuloData.no_articulo)},
descripcion_articulo = ${connection.escape(ArticuloData.descripcion_articulo)},
base_legal = ${connection.escape(ArticuloData.base_legal)},
monto_Articulo  = ${connection.escape(ArticuloData.monto_Articulo)},
datos_vehiculo_id = ${connection.escape(ArticuloData.datos_vehiculo_id)},
datos_Articulo_id  = ${connection.escape(ArticuloData.datos_Articulo_id)}
WHERE id= ${connection.escape(ArticuloData.id)}
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
//-------------------------Metodo de eliminacion--------------------------------
ArticuloModel.deleteArticulo = (id, callback)=>{
  if (connection) {
    let sql = `SELECT * FROM articulo_infringido WHERE id = ${connection.escape(id)}`;
    connection.query(sql, (err, row)=> {
      if (row) {
        let sql = `DELETE FROM articulo_infringido WHERE id = ${id}`;
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
module.exports = ArticuloModel;
