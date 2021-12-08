const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Checkout = new Schema({
    checkoutItem: 
    {
        type: String,
        required: true
    },
    checkoutDescription: 
    {
        type: String,
        required: true
    }
});
mongoose.model('Checkout',Checkout);