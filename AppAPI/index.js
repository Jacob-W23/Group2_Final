const express = require('express');
const app = express();
const nodemon = require('nodemon');
app.use(express.json());

//MongoDB Package
const mongoose = require('mongoose');

const PORT = 1250;

const dbUrl = "mongodb+srv://admin:Passw0rd@cluster0.vpu9l.mongodb.net/G2Final?retryWrites=true&w=majority";

//Connect to MongoDB
mongoose.connect(dbUrl,{
    useNewUrlParser: true,
    useUnifiedTopology: true
});

//MongoDB Connection
const db = mongoose.connection;

//Handle DB Error, display connection
db.on('error', () => {
    console.error.bind(console,'connection error: ');
});
db.once('open',() => {
    console.log('MongoDB Connected')
});

require('./Models/Movies');
require('./Models/Shows');
require('./Models/Wishlist');
require('./Models/Checkout');

const Movies = mongoose.model('Movies');
const Shows = mongoose.model('Shows');
const Wishlist = mongoose.model('Wishlist');
const Checkout = mongoose.model('Checkout');

//Movie Routes

//Add movie
app.post('/addMovie', async(req, res)=>{
    try{
        let movie = {
            moviePoster: req.body.moviePoster,
            movieName: req.body.movieName,
            movieDescription: req.body.movieDescription,
        }
    
    await Movies(movie).save().then(c =>{
        return res.status(201).json('{Message: Movie added}');
    });
    }catch{
        return res.status(500).json('{Message: Could not add movie}');
    }
});

//Get all movies
app.get('/getAllMovies', async(req,res)=>{
    try{
        let movies = await Movies.find({}).lean();
        return res.status(200).json({ "Movies": movies });
    }catch{
        res.status(500).json('{Message: Could not find movies}');
    }
});

//Get movie by name
app.post('/findMovie', async(req,res)=>{
    try{
        let movie = await Movies.find({movieName: req.body.movieName}).lean();
        return res.status(200).json({ "Movie": movie });
    }catch{
        res.status(500).json('{Message: Could not find movie}');
    }    
});

//Delete movie by name
app.post('/deleteMovie', async (req,res)=>{
    try{
        movie = await Movies.findOne({movieName: req.body.movieName});

        if(movie) {
            await Movies.deleteOne({movieName: req.body.movieName});
            return res.status(200).json("{Message: Movie deleted}")
        } else {
            return res.status(200).json("{Message: No movie deleted - query null}")
        }
    } catch {
        return res.status(500).json("{Message: Failed to delete movie}");
    }
});


//Show Routes

//Add Show
app.post('/addShow', async(req, res)=>{
    try{
        let show = {
            showPoster: req.body.showPoster,
            showName: req.body.showName,
            showDescription: req.body.showDescription
        }
    
    await Shows(show).save().then(c =>{
        return res.status(201).json('{Message: show added}');
    });
    }catch{
        return res.status(500).json('{Message: Could not add show}');
    }
});

//Get all shows
app.get('/getAllShows', async(req,res)=>{
    try{
        let shows = await Shows.find({}).lean();
        return res.status(200).json({ "Shows": shows });
    }catch{
        res.status(500).json('{Message: Could not find shows}');
    }
});

//Get show by name
app.post('/findShow', async(req,res)=>{
    try{
        let show = await Shows.find({showName: req.body.showName}).lean();
        return res.status(200).json({ "Show": show });
    }catch{
        res.status(500).json('{Message: Could not find show}');
    }    
});

//Delete show by name
app.post('/deleteShow', async (req,res)=>{
    try{
        show = await Shows.findOne({showName: req.body.showName});

        if(show) {
            await Shows.deleteOne({showName: req.body.showName});
            return res.status(200).json("{Message: Show deleted}")
        } else {
            return res.status(200).json("{Message: No show deleted - query null}")
        }
    } catch {
        return res.status(500).json("{Message: Failed to delete show}");
    }
});


//Wishlist Routes

//Add item to wishlist
app.post('/addWishlistItem', async(req, res)=>{
    try{
        let item = {
            wishlistPoster: req.body.wishlistPoster,
            wishlistItem: req.body.wishlistItem,
            itemDescription: req.body.itemDescription
        }
    
    await Wishlist(item).save().then(c =>{
        return res.status(201).json('{Message: item added to wishlist}');
    });
    }catch{
        return res.status(500).json('{Message: Could not add item to wishlist}');
    }
});

//Get the entire wishlist
app.get('/getWishlist', async(req,res)=>{
    try{
        let items = await Wishlist.find({}).lean();
        return res.status(200).json({ "Items": items });
    }catch{
        res.status(500).json('{Message: Could not find wishlist items}');
    }
});

//Get wishlist item by name
app.post('/findWishlistItem', async(req,res)=>{
    try{
        let item = await Wishlist.find({wishlistItem: req.body.wishlistItem}).lean();
        return res.status(200).json({ "Item": item });
    }catch{
        res.status(500).json('{Message: Could not find wishlist item}');
    }    
});

//Delete wishlist item by name
app.post('/deleteWishlistItem', async (req,res)=>{
    try{
        item = await Wishlist.findOne({wishlistItem: req.body.wishlistItem});

        if(item) {
            await Wishlist.deleteOne({wishlistItem: req.body.wishlistItem});
            return res.status(200).json("{Message: Wishlist item deleted}")
        } else {
            return res.status(200).json("{Message: No item deleted - query null}")
        }
    } catch {
        return res.status(500).json("{Message: Failed to delete wishlist item}");
    }
});


//Checkout Routes

//Add item to checkout
app.post('/addCheckoutItem', async(req, res)=>{
    try{
        let item = {
            checkoutPoster: req.body.checkoutPoster,
            checkoutItem: req.body.checkoutItem,
            checkoutDescription: req.body.checkoutDescription
        }
    
    await Checkout(item).save().then(c =>{
        return res.status(201).json('{Message: item added to checkout}');
    });
    }catch{
        return res.status(500).json('{Message: Could not add item to wishlist}');
    }
});

//Get the entire checkout
app.get('/getCheckout', async(req,res)=>{
    try{
        let items = await Checkout.find({}).lean();
        return res.status(200).json({ "Items": items });
    }catch{
        res.status(500).json('{Message: Could not find checkout items}');
    }
});

//Get checkout item by name
app.post('/findCheckoutItem', async(req,res)=>{
    try{
        let item = await Checkout.find({checkoutItem: req.body.checkoutItem}).lean();
        return res.status(200).json({ "Item": item });
    }catch{
        res.status(500).json('{Message: Could not find checkout item}');
    }    
});

//Delete checkout item by name
app.post('/deleteCheckoutItem', async (req,res)=>{
    try{
        item = await Checkout.findOne({checkoutItem: req.body.checkoutItem});

        if(item) {
            await Checkout.deleteOne({checkoutItem: req.body.checkoutItem});
            return res.status(200).json("{Message: Checkout item deleted}")
        } else {
            return res.status(200).json("{Message: No item deleted - query null}")
        }
    } catch {
        return res.status(500).json("{Message: Failed to delete checkout item}");
    }
});

app.listen(PORT, () => {
    console.log(`Server Started on port ${PORT}`);
})