const mongoose=require('mongoose');

const userSchema=mongoose.Schema({

    _id:mongoose.Schema.Types.ObjectId,
    username:{
        type: String,
        required: true,
    },
    email:{
        type:String,
        required: true,
    },
    password:{
        type:String,
        required: true,
    },
    role:{
        type:String,
        required: true,
    },
    token:{
        type:String
    },
    comments:[ 
        {
           type: mongoose.Schema.Types.ObjectId,
           ref :"Comment",
           required:false,
        },
    ],
    rating_id:{
        type:mongoose.Schema.Types.ObjectId,
        ref:"Rating",
        required:false,
    }

},{strict: false});
module.exports = mongoose.model('User', userSchema);
