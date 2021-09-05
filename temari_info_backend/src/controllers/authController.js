const User = require('../models/UserModel')
const express=require('express');
const mongoose=require('mongoose');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const nodemailer = require("nodemailer");


const TOKEN_KEY=process.env.TOKEN_KEY


async function signIn(req, res) {
  try {
    const { email, password } = req.body;

    if (!(email && password)) {
      res.status(400).send("All input is required");
    }
  
    const user = await User.findOne({ "email":email });
    if (user && (await bcrypt.compare(password, user.password))) {
      
      const token = jwt.sign(
        { user_id: user._id, email },
        TOKEN_KEY,
        {
          expiresIn: "2h",
        }
      );

      
      user.token = token;
    res.status(200).json(user);
    }
    
    res.status(400).send("Invalid Credentials");
  } catch (error) {
    res.status(500)
    }
};

async function signUp(req, res) {
  try {
    
      const { username, email, password,} = req.body;
      if (!(username && email && password)) {
        res.status(400).send("All input is required");
      }
      const oldUser = await User.findOne({ "email": email });
    if (oldUser) {
      return res.status(409).send("User Already Exist. Please Login");
    }
    
    encryptedPassword = await bcrypt.hash(password, 10);
    
      const user =await new User({
        _id: mongoose.Types.ObjectId(),
        username: username,
        email: email.toLowerCase(),
        password: encryptedPassword,
        role: "Normal User"
      }).save();

      
      const token = jwt.sign(
        { user_id: user._id, email },
        TOKEN_KEY,
        {
          expiresIn: "2h",
        }
      );
      user.token = token;
      
      res.status(201).json(user);
  } catch (error) {
    res.status(500)
  }
};


async function sendEmail (email, subject, text)  {
    try {
        const transporter = nodemailer.createTransport({
            host: process.env.HOST,
            port: 587,
            secure: false,
            auth: {
                user: process.env.TEMARI_USER,
                pass: process.env.TEMARI_PASS,
            },
        });

        await transporter.sendMail({
            from: `${process.env.USER}@gmail.com`,
            to: email,
            subject: subject,
            text: text,
        });
    

        console.log("Email sent sucessfully");
    } catch (error) {
        console.log(error, "Email not sent");
    }
};

async function forgotPassword (req, res) {
    try {
      const { email } = req.body;
      const token = jwt.sign({ email }, TOKEN_KEY, {
        expiresIn: "40m",
      });

      const  BASE_URL = "http://localhost:3000/api"
      const link = `${BASE_URL}/auth/reset-password/${token}`
      const text = ` Plsease follow the link below to reset your password \n ${link}
      \nOr you can copy this code:  ${token}`
      await sendEmail(email, "TemariInfo Password Reset Link",text )

      const updateLink = {
        resetLink: token,
      };
      
      let user = await User.findOneAndUpdate({"email":email },updateLink, {new: true});
      return res.status(201).json({ message: user, success: true });

    } catch (error) {
      return res.status(400).json({ message: error.message, success: false });

    }
  };
  
  async function resetPassword (req, res )  {
    try {
      const resetLink = req.body.resetLink || req.params.resetLink
      const password = req.body.password;
      const decoded = jwt.verify(resetLink, TOKEN_KEY);
      
      if (decoded.exp < Date.now() / 1000) {
        return res.status(400).json({ message: "Expired Token", success: false });
      }
      
      encryptedPassword = await bcrypt.hash(password, 10);

      const user = await User.findOneAndUpdate(
        { resetLink },
        { password:encryptedPassword
          , resetLink: "" },
        {
          new: false,
        }
      );
      
        if (!user){
          return res.status(404).json({ message: "account not found...try again!", success: false });
        }
      return res.status(201).json({ message: user, success: true });
    } catch (error) {
      return res.status(401).json({ message: error.message, success: false });
    }
  };

module.exports = {
    signUp,
    signIn,
    forgotPassword,
    resetPassword,
    sendEmail
};