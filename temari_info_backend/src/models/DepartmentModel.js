const mongoose = require("mongoose")
const departmentschema=mongoose.Schema({
    _id:mongoose.Schema.Types.ObjectId,
    dept_name:{
        type:String,
        required:true

    },
    years:{
        type:Number,
        required:true
    },
    objective:{
        type:String,
        required:true
    },
    institute_id:{
        type: mongoose.Schema.Types.ObjectId,
        ref: "Institute",
        required: true,

    }

});
module.exports = mongoose.model('Departments', departmentschema);