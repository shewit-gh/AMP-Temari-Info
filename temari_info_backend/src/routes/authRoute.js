var express = require('express');
var router = express.Router();
var authController = require('../controllers/authController');
var auth = require('../middlewares/auth')
//pass auth between url and function for routes that require being logged in

router.post('/signUp',authController.signUp );
router.post('/signIn',authController.signIn );
router.put('/forgot-Password',authController.forgotPassword);
router.put('/reset-Password',authController.resetPassword);
router.get("/welcome", auth, (req, res) => {
    res.status(200).send("Welcome 🙌 ");})

module.exports = router;