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

module.exports = getUniversity



