const mongoose=require('mongoose');

const userSchema=mongoose.Schema({

    _id:mongoose.Schema.Types.objectId,
    username:{
        type: String,
        required: true,
    },
    email:{
        type:String,
        required: true,
    },
    password:{
        type:mongoose.Schema.Types.objectId,
        required: true,
    },
    role:{
        type:String,
        required: true,
    },
    comments:[ 
        {
           type: mongoose.Schema.Types.objectId,
           ref :"Comment",
           required:false,
        },
    ],
    rating_id:{
        type:mongoose.Schema.Types.objectId,
        ref:"Rating"
    }

});
module.exports = mongoose.model('User', userSchema);
