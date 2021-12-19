import 'package:flutter/material.dart';
import 'checkOut.dart';
import 'main.dart';

class SuccessCheckout extends StatefulWidget {
  int checkoutItem;

  SuccessCheckout(this.checkoutItem);

  @override
  _SuccessCheckoutState createState() => _SuccessCheckoutState(checkoutItem);
}

class _SuccessCheckoutState extends State<SuccessCheckout> {
  int checkoutItem;
  _SuccessCheckoutState(this.checkoutItem);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: Text(
                'Successfully checked out ' +
                    checkoutItem.toString() +
                    ' item(s).',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () => {
          Navigator.pop(context),
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(title: "Entertainment Tracker")))
        },
      ),
    );
  }
}
