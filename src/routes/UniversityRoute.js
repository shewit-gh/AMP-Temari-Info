var express = require('express');
var router = express.Router();
const getUniversity = require("../controllers/UniversityController");


/* GET university listing. */
router.get('/', getUniversity);

module.exports = router;