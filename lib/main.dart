import 'package:flutter/material.dart';
import 'package:group2final/Models/Checkout.dart';
import 'package:group2final/Models/Wishlist.dart';
import 'movies.dart';
import 'splash.dart';
import 'tvShows.dart';
import 'wishList.dart';
import 'checkOut.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entertainment Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/space.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Movies(
                          'moviePoster', 'movieName', 'movieDescription'),
                    ),
                  );
                },
                child: Text("Movies"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 40),
                  primary: Colors.purple,
                  textStyle: TextStyle(fontSize: 28),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TVShows(),
                    ),
                  );
                },
                child: Text("TV Shows"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 40),
                  primary: Colors.red,
                  textStyle: TextStyle(fontSize: 28),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WishList(),
                    ),
                  );
                },
                child: Text("Wish List"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 40),
                  primary: Colors.green,
                  textStyle: TextStyle(fontSize: 28),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckOut(),
                    ),
                  );
                },
                child: Text("Checkout"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 40),
                  primary: Colors.yellow,
                  textStyle: TextStyle(fontSize: 28),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
