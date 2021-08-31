const mongoose = require('mongoose');

const imageModel = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    image_name:{
        type: String,
        required: true
    },
    university_id:{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'UNiversity',
        required: true
    }
  

});

module.exports = mongoose.model('Image', imageModel);