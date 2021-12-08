const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Shows = new Schema({
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