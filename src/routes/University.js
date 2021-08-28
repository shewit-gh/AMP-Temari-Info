var express = require('express');
var router = express.Router();
const getUniversity = require("../controllers/University"); 

/* GET users listing. */
router.get('/', getUniversity);

module.exports = router;