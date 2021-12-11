const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Movies = new Schema({
    moviePoster:{
        type: String,
        required: true
    },
    movieName: 
    {
        type: String,
        required: true
    },
    movieDescription: 
    {
        type: String,
        required: true
    }
});
mongoose.model('Movies',Movies);