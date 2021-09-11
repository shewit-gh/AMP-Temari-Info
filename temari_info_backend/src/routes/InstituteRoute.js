var express = require('express');
var router = express.Router();
var instController = require('../controllers/InstituteController');

router.get('/', instController.getAll);
router.get('/:instId', instController.getOne);
router.delete('/:instId', instController.delete);
router.post('/', instController.post);
router.put('/:instId', instController.put);

module.exports = router;