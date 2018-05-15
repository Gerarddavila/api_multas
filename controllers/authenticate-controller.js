var express=require("express");
var bodyParser=require('body-parser');
var jwt=require('jsonwebtoken');
var connection = require('./../src/db/db');
module.exports.authenticate=function(req,res){
    var usuario=req.body.usuario;
    var password=req.body.password;
    connection.query('SELECT * FROM credenciales WHERE usuario = ?',[usuario], function (error, results, fields) {
      if (error) {
          res.json({
            status:false,
            message:'Hay algún error con la consulta'
            })
      }else{
        if(results.length >0){
            if(password==results[0].password){
                var token=jwt.sign({id:usuario.id},process.env.SECRET_KEY,{
                    expiresIn:5000
                });
                res.json({
                    status:true,
                    token:token
                })
            }else{
                res.json({
                  status:false,
                  message:"El usuario y la contraseña no coinciden"
                 });
            }

        }
        else{
          res.json({
              status:false,
            message:"El usuario no existe"
          });
        }
      }
    });
}
