var express = require('express');
var router = express.Router();
var rateController= require('../controllers/RatingController')

router.get('/', rateController.getAll);
router.get('/:rateId', rateController.getOne);
router.delete('/:rateId', rateController.delete);
router.post('/', rateController.post);
router.patch('/:instId', rateController.patch);

module.exports = router;