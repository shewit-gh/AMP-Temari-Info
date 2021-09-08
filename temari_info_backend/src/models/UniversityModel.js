const { string, required } = require('joi');
const mongoose = require('mongoose');

const universitySchema = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    univ_name: {
        type: String,
        required: true,
    },
    short_name: {
        type: String,
        required: true,
    },
    location: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: false,
    },

    // image:{
    //     type: String,
    //     required: false
    // },
    
    image_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Image",
        required: false,
    },
    institute: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Institute",
            required: false,
        },
    ],
    comment: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Comment",
            required: false,
        },
    ],
    rating: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Rating",
            required: false,
        },
    ],
});




module.exports = mongoose.model('University', universitySchema);