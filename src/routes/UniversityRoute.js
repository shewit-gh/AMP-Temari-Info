var express = require('express');
var router = express.Router();
const University = require("../controllers/UniversityController");


/* GET university listing. */
// router.get('/', getUniversity);
router.post('/', University.postUniversity);

module.exports = router;