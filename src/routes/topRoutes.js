const Top = require('../models/top');
module.exports = function (app) {

  app.get('/top', (req, res) => {
      Top.getTop((err, data) => {
      res.status(200).json(data);
    });
  });

  app.get('/top-costo', (req, res) => {
      Top.getTopCosto((err, data) => {
      res.status(200).json(data);
    });
  });
}
