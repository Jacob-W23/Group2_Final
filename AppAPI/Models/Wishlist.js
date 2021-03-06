const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Wishlist = new Schema({
    wishlistPoster:{
        type: String,
        required: true
    },
    wishlistItem: 
    {
        type: String,
        required: true
    },
    itemDescription: 
    {
        type: String,
        required: true
    }
});
mongoose.model('Wishlist',Wishlist);