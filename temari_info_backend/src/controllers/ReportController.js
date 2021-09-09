const Report = require('../models/ReportModel');
const User = require('../models/UserModel')
const express=require('express');
const mongoose=require('mongoose');
const sendEmail = require('./authController').sendEmail;

const getReports = async ( req, res, next) => {
  try {
    reports = await Report.find()
    res.status(200).send(reports)
  } catch (error) {
    res.status(500)
  }
};

const getReport = async (req, res, next) => {
  try {
    reportId = req.params.reportId
    report = await Report.find({"_id": reportId})
    res.status(200).send(report)

  } catch (error) {
    res.status(500)
  }
};

const sendReport = async ( req, res, next) => {
  try {
      const description =req.body.description;
      const user_id =req.body.user_id;
      const comment_id =req.body.comment_id;
      const reporter_id = req.body.reporter_id;
    
      const report =await new Report({
        _id: mongoose.Types.ObjectId(),
        description: description,
        user_id: user_id,
        reporter_id: reporter_id,
        comment_id: comment_id,
      }).save();

      console.log("hereeee")
    res.status(200).send(report)

  } catch (error) {
    res.status(500)
  }
};

const sendWarning = async ( req, res, next) => {
  try {
    const report_id = req.params.report_id
    const user_id =req.params.user_id;
    user = await User.find({"_id": user_id})
    report = await Report.findOneAndRemove({"_id":report_id})

    text = `You have been reported for inappropriate behaviour so this is a warning.
     If we recieve another report the next action would be to totally remove you from our website.
            \n\nwith Regard,\n TemariInfo team`
            
    await sendEmail(user.email, "TemariInfo warning",text )

    res.status(200).send(report)
  } catch (error) {
    res.status(500)
  }
};

const DeleteAccount = async ( req, res, next) => {
    try {
      report_id = req.params.report_id
      const user_id =req.params.user_id;
      user = await User.findOneAndRemove({"_id": user_id})
      report = await Report.findOneAndRemove({"_id":report_id})
  
      text = `You have been reported for inappropriate behaviour several times so we have removed you from our account!!\n TemariInfo team`
              
      await sendEmail(user.email, "TemariInfo removal",text )
  
      res.status(200).send({report,user})
    } catch (error) {
      res.status(500)
    }
  };



module.exports = {
    getReports,
    getReport,
    sendReport,
    sendWarning,
    DeleteAccount,
};