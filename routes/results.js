var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('results', { title: 'Raffle Results', style: "main" });
});

module.exports = router;
