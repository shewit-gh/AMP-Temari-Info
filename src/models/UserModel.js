const mogoose=require('mongoose');

const userSchema=mogoose.Schema({

    _id:mogoose.Schema.Types.objectId,
    username:{
        type: String,
        required: true,
    },
    email:{
        type:String,
        required: true,
    },
    password:{
        type:mogoose.Schema.Types.objectId,
        required: true,
    },
    role:{
        type:String,
        required: true,
    },
    comments_id: {
        type: mogoose.Schema.Types.objectId,
        ref :"Comment",
        required:false,

    },
    rating_id:{
        type:mogoose.Schema.Types.objectId,
        ref:"Rating"
    }



});
module.exports = mongoose.model('User', userSchema);
