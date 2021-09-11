const User = require('../models/UserModel');
const express=require('express');
const mongoose=require('mongoose');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const sendEmail = require('./authController').sendEmail;

const getUsers = async ( req, res, next) => {
  try {
    users = await User.find()
    res.status(200).send(users)
  } catch (error) {
    res.status(500)
  }
};

const getUser = async (req, res, next) => {
  try {
    userId = req.params.userId
    user = await User.findOne({"_id": userId})
    res.status(200).send(user)

  } catch (error) {
    res.status(500)
  }
};

const updateUser = async ( req, res, next) => {
  try {
    userId = req.params.userId
    
    const updatedUser = { };
    for (const ops of req.body) {
      updatedUser[ops.propName] = ops.value;
  }
  if (password in updatedUser){
    encryptedPassword = await bcrypt.hash(password, 10);
    updatedUser[password] = encryptedPassword
  }
  if (username in updatedUser){
    const oldUser = await User.findOne({"email": updatedUser[email] },);

  if (oldUser._id != userId) {
    return res.status(409).send("Email Already Exist");
  }
  }
    user = await User.findOneAndUpdate({"_id":userId},{$set:updatedUser}, {new: true})

    const token = jwt.sign(
      { user_id: user._id,email: user.email,role:user.role,username:user.username },
      process.env.TOKEN_KEY,
      {
        expiresIn: "2h",
      }
    );
    res.status(200).send(token)

  } catch (error) {
    res.status(500)
  }
};

const deleteUser = async ( req, res, next) => {
  try {
    userId = req.params.userId
    user = await User.findOneAndRemove({"_id":userId})
    res.status(200).send(user)
  } catch (error) {
    res.status(500)
  }
};

const addUniversityUser = async (req, res, next) => {
    try {
            const { username, email, password,} = req.body;
            if (!(username && email && password)) {
              res.status(400).send("All input is required");
            }
            
            const oldUser = await User.findOne({ "email": email });
          if (oldUser) {
            return res.status(409).send("A user with this account already exist");
          }
          
          encryptedPassword = await bcrypt.hash(password, 10);
          
            const user =await new User({
              _id: mongoose.Types.ObjectId(),
              username: username,
              email: email.toLowerCase(),
              password: encryptedPassword,
              role: "University User"
            }).save();
      
            const token = jwt.sign(
              { user_id: user._id,email: user.email,role:user.role,username:user.username },
              process.env.TOKEN_KEY,
              {
                expiresIn: "2h",
              }
            );

            user.token = token;
            text = `Your request for creating a university account has been accepted. You can use the 
            password below to log into your account. Make sure to change you password after logging in!
            \n password : ${password}
            \n\nThank you!`
            
            await sendEmail(email, "TemariInfo Request for university accepted",text )

            res.status(201).json(user);
        } catch (error) {
          res.status(500)
        }
      };
      
  

module.exports = {
    getUsers,
    getUser,
    updateUser,
    deleteUser,
    addUniversityUser
};