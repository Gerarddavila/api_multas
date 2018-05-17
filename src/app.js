const express = require('express');
const jwt = require('jsonwebtoken');
const app = express();

const morgan = require ('morgan');
const bodyParser = require('body-parser');

//variables
var router=express.Router();
var authenticateController=require('../controllers/authenticate-controller');
process.env.SECRET_KEY="thisismysecretkey";
//Configuracion del puerto

app.set('port', process.env.PORT || 3000);

// middlewares

app.use (morgan('dev'));
app.use (bodyParser.json());

app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());
app.post('/api/authenticate',authenticateController.authenticate);
app.use('/secure-api',router);

//routes
require ('./routes/articuloRoutes')(app);
require('./routes/agenteRoutes') (app);
require('./routes/observacionesRoutes') (app);
require('./routes/privilegiosRoutes') (app);
require('./routes/credencialesRoutes') (app);
require ('./routes/infraccionRoutes')(app);
require('./routes/infractorRoutes')(app);
require('./routes/vehiculoRoutes')(app);
require('./routes/detalleRoutes')(app);
require('./routes/detallePlacaRoutes')(app);
require('./routes/topRoutes')(app);

// validation middleware
router.use(function(req,res,next){
    var token=req.body.token || req.headers['token'];
    if(token){
        jwt.verify(token,process.env.SECRET_KEY,function(err,ress){
            if(err){
                res.status(500).send('Token Invalido');
            }else{
                next();
            }
        })
    }else{
        res.send('Por favor envía un token')
    }
})
router.get('/home',function(req,res){
    res.send('Token Verificado')
})
router.get('/credenciales',function(req,res){

    res.send('Token Verificado')

})
app.listen(app.get('port'), () => {
  console.log('server on port 3000');
});
//app.listen(8012);
