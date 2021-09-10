// const models = require('../models')
const express = require('express');
const mongoose = require('mongoose');

const University = require('../models/UniversityModel');

// Get all University

function getUniversity(req, res) {
    University.find().populate("institute").populate({path:"comment", populate: "user_id"}).populate("rating")
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

// Get University by id

function getUniversityById(req, res) {
    const id = req.params.univId;
    University.findById(id).populate("institute").populate("comment").populate("rating")
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

// Update University 

function updateUniversityByID(req, res) {
    const id = req.params.univId;
    const updateOps = {};
    for (const ops of req.body) {
        updateOps[ops.propName] = ops.value;
    }

    University.updateMany({ _id: id },
        { $set: updateOps })
        .exec()
        .then(result => {
            res.status(200).json(result);
        })
        .catch(err => {
            res.status(500).json({
                error: err
            });
        });
}

// delete University 

function deleteUniversityByID(req, res) {
    const id = req.params.univId;
    University.remove({ _id: id })
        .exec()
        .then(result => {
            res.status(200).json(result);
        })
        .catch(err => {
            res.status(500).json({
                error: err
            });
        });
}

// Search University 

function searchUniversity(req, res) {

    var regex = new RegExp(req.params.univName, 'i'); // 'i' makes it case insensitive
    University.find({ univ_name: regex }).populate("comment").populate("rating").populate("institute")
        .then(result => {
            res.status(200).json(result);
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
    getUniversityById,
    updateUniversityByID,
    deleteUniversityByID,
    searchUniversity

};



