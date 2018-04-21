const express = require('express');
const app = express();

const morgan = require ('morgan');
const bodyParser = require('body-parser');

//Configuracion del puerto

app.set('port', process.env.PORT || 3000);

// middlewares

app.use (morgan('dev'));
app.use (bodyParser.json());


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

app.listen(app.get('port'), () => {
  console.log('server on port 3000');
});
