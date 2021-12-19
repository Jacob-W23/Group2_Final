import 'package:flutter/material.dart';
import 'package:group2final/splash.dart';
import 'package:group2final/successCheckout.dart';
import 'main.dart';
import 'AppAPI.dart';
import 'wishList.dart';

class CheckOut extends StatefulWidget {
  String checkoutPoster, checkoutItem, checkoutDescription;
  CheckOut(this.checkoutPoster, this.checkoutItem, this.checkoutDescription);

  final AppAPI api = new AppAPI();

  @override
  _CheckOutState createState() =>
      _CheckOutState(checkoutPoster, checkoutItem, checkoutDescription);
}

class _CheckOutState extends State<CheckOut> {
  String checkoutPoster, checkoutItem, checkoutDescription;
  _CheckOutState(
      this.checkoutPoster, this.checkoutItem, this.checkoutDescription);

  bool loaded = false;
  List checkedOut = [];

  void initState() {
    super.initState();

    widget.api.getCheckout().then((data) {
      setState(() {
        checkedOut = data;
        loaded = true;
      });
    });
  }

  void _displayItems() {
    widget.api.getCheckout().then((data) {
      setState(() {
        checkedOut = data;
        loaded = true;
      });
    });
  }

  void _deleteItem(name) {
    setState(() {
      Navigator.pop(context);

      widget.api.deleteCheckoutItem(name);
      Icon(Icons.refresh);
      _displayItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: loaded
          ? Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ...checkedOut
                          .map<Widget>(
                            (checkedParam) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              child: TextButton(
                                onPressed: () => {
                                  Navigator.pop(context),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CheckOut(
                                                checkedParam['checkoutPoster'],
                                                checkedParam['checkoutItem'],
                                                checkedParam[
                                                    'checkoutDescription'],
                                              ))),
                                },
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.purple),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: ListTile(
                                      leading: Image.network(
                                        checkedParam['checkoutPoster'],
                                        width: 120.0,
                                        height: 600.0,
                                        fit: BoxFit.fill,
                                      ),
                                      title: Text(
                                        checkedParam['checkoutItem'],
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      subtitle: Text(
                                          checkedParam['checkoutDescription']),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () => {
                                          _deleteItem(
                                            checkedParam['checkoutItem'],
                                          ),
                                        },
                                      )),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SuccessCheckout(checkedOut.length))),
                        child: Text("Check out: " +
                            checkedOut.length.toString() +
                            " item(s)"),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Database Loading",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  CircularProgressIndicator()
                ],
              ),
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
