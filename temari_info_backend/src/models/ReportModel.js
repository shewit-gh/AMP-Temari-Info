const mongoose = require('mongoose');

const ReportSchema = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    description: {
        type: String,
        required: true,
    },
    user_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
        required: true,
    },
    reporter_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
        required: true,
    },
    comment_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Comment",
        required: true,
    },
    
});




module.exports = mongoose.model('Report', ReportSchema);