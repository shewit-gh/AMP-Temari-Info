var express = require('express');
var router = express.Router();
const User = require("../controllers/UserController");

router.get('/', User.getUsers);
router.get('/:userId', User.getUser);
router.put('/:userId', User.updateUser);
router.delete('/:userId', User.deleteUser);
router.post('/addUniversity',User.addUniversityUser)

module.exports = router;