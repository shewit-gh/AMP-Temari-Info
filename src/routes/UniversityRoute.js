var express = require('express');
var router = express.Router();
const University = require("../controllers/UniversityController");


/* GET university listing. */

router.get('/', University.getUniversity);
router.post('/', University.postUniversity);
router.get('/:univId', University.getUniversityById);
router.patch('/:univId', University.updateUniversityByID);

module.exports = router;