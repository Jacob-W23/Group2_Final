const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Shows = new Schema({
    showPoster:{
        type: String,
        required: true
    },
    showName: 
    {
        type: String,
        required: true
    },
    showDescription: 
    {
        type: String,
        required: true
    }
});
mongoose.model('Shows',Shows);