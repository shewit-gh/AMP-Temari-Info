const mongoose = require('mongoose');

const instSchema = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    institute_name:{
        type: String,
        required: true
    },
    phone_no:{
        type: String,
        required: false,
    },
    email:{
        type: String,
        required: false
    },
    description: {
        type: String,
        required: true
    },
    university_id:{
        type: mongoose.Schema.Types.ObjectId,
        ref: "Univresity",
        required:true
    },
    department_id:{
        type: mongoose.Schema.Types.ObjectId,
        ref: "Department",
        required:true
    }

});


module.exports = mongoose.model('Institute', instSchema);
