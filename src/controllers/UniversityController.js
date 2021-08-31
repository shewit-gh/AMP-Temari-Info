// const models = require('../models')
const express = require('express');
const mongoose = require('mongoose');

const University = require('../models/UniversityModel');

function getUniversity(req, res) {
    try {
        return res.status(200).send('respond with a resource');
    } catch (e) {
        console.error(e);
        res.status(400).end();
    }
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
            console.log(result);
            res.status(201).json({
                message: "posting..",
                createdUniversity: result
            });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({
                error: err
            });
        });

}


module.exports = {
    // getUniversity,
    postUniversity,

};



