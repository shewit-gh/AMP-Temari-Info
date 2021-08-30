const mongoose = require('mongoose');

const CommentSchema = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    comment: {
        type: String,
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
    timestamps: {
        createdAt: 'created_at',
        updatedAt: 'updated_at'
    }
    
});




module.exports = mongoose.model('Comment', CommentSchema);