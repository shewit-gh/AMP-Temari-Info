var express = require('express');
var router = express.Router();
const University = require("../controllers/UniversityController");


/* GET university listing. */

router.get('/', University.getUniversity);
router.post('/', University.postUniversity);
router.get('/:univId', University.getUniversityById);
router.put('/:univId', University.updateUniversityByID);
router.delete('/:univId', University.deleteUniversityByID);
router.get('/search/:univName', University.searchUniversity);

module.exports = router;