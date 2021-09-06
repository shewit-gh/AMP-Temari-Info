var express = require('express');
var router = express.Router();
var commentController=require('../controllers/CommentController')

router.get('/', commentController.get);
router.delete('/:commentId', commentController.delete);
router.post('/', commentController.post);
router.patch('/:commentId', commentController.patch);

module.exports = router;