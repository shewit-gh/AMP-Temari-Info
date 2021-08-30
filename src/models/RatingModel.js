const mongoose = require('mongoose');

const RatingSchema = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    rating: {
        type: Number,
        required: true,
    },
    univerity_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Uiversity",
        required: true,
    },
    user_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
        required: true,
    },
    
});




module.exports = mongoose.model('Rating', RatingSchema);