const Vehiculo = require('../models/vehiculo');
module.exports = function (app) {
  app.get('/vehiculo', (req, res) => {
    //res.json([]);
    Vehiculo.getVehiculo((err, data) => {
      res.status(200).json(data);
    });
  });

  app.post('/vehiculo', (req, res) => {
    //console.log(req, body);
    const vehiculoData = {
      id:null,
      vehiculo:req.body.vehiculo
    };
  //});
  Vehiculo.insertVehiculo(vehiculoData, (err, data) => {
  if (data && data.insertId) {
    console.log(data);
  res.json ({
    success: true,
    msg: 'Vehiculo Insertado',
    data:data
  })
} else {
  res.status(500).json({
    success:false,
    msg: 'Error'
  })
}
})
});

app.put('/vehiculo/:id', (req, res) => {
  const vehiculoData = {
  id: req.params.id,
  vehiculo: req.body.vehiculo
  };

  Vehiculo.updateVehiculo(vehiculoData, (err, data) =>{
  if (data && data.msg) {
    res.json(data)
  }  else {
    res.json({
      success: false,
      msg: 'Error'
    })
  }
  })

});


app.delete('/vehiculo/:id', (req, res) => {
  Vehiculo.deleteVehiculor(req.params.id, (err, data) => {

    if (data && data.msg === 'Eliminado' || data.msg ==='No Existe') {
res.json ({
  success: true,
data

})
} else {
  res.status(500),json({
    msg: 'Error'
  })
}
  });

});
}
