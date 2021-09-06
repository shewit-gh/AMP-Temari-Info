const mongoose = require('mongoose');

const instSchema = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    univ_id:{
        type: mongoose.Schema.Types.ObjectId,
        ref: "University",
        required:true
    },
    inst_name:{
        type: String,
        required: true
    },
    phone:{
        type: String,
        required: false,
    },
    email:{
        type: String,
        required: false
    },
    inst_description: {
        type: String,
        required: true
    },
    
    department_id:[
        {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Departments",
        required:true
        }
    ]    

});


module.exports = mongoose.model('Institute', instSchema);
