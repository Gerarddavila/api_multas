const Detalle = require('../models/placa');
module.exports = function (app) {

  app.get('/placa', (req, res) => {
      Detalle.getPlaca((err, data) => {
      res.status(200).json(data);
    });
  });

  app.get('/placa/:placa', (req, res) => {
    const placaData ={
      placa: req.params.placa
    };
      Detalle.getPlacaIndividual(placaData,(err, data) => {
      res.status(200).json(data);
    });
  });
}
