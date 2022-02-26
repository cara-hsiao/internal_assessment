var express = require('express');
var router = express.Router();
var db = require('../db/db');


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('blacklist', { title: 'Blacklist', style: "main" });
});


const insert_sql = `
INSERT INTO email
(email)

VALUES
(?)
`

router.post('/', async function(req, res, next) {
  await db.queryPromise(inssert_sql, [req.body.email])
  console.log("Insert query finished");

  // res.render('blacklist', { title: 'Blacklist', style: "main" });
  res.redirect("/")
});


module.exports = router;
