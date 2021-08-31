// const models = require('../models')
const express = require('express');
const mongoose = require('mongoose');

const University = require('../models/UniversityModel');

// Get all University

function getUniversity(req, res) {
    University.find()
        .exec()
        .then(doc => {
            if (doc) {
                res.status(200).json(doc);
            }
            else {
                res.status(404).json({ message: "Page not found" })
            }

        })
        .catch(err => {
            res.status(500).json({
                error: err
            });
        });
}

// Post University

function postUniversity(req, res) {
    const university = new University({
        _id: new mongoose.Types.ObjectId(),
        univ_name: req.body.univ_name,
        short_name: req.body.short_name,
        location: req.body.location,
        description: req.body.description,
    });

    university
        .save()
        .then(result => {

            res.status(201).json({
                message: "posting..",
                createdUniversity: result
            });
        })
        .catch(err => {

            res.status(500).json({
                error: err
            });
        });

}


module.exports = {
    getUniversity,
    postUniversity,

};



