import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hungreez/constants.dart';
import 'package:hungreez/pay_gate.dart';

class FoodCartScreen extends StatefulWidget {
  @override
  _FoodCartScreenState createState() => _FoodCartScreenState();
}

class _FoodCartScreenState extends State<FoodCartScreen> {
  List<DocumentSnapshot> _menuItems = [];
  List<DocumentSnapshot> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _fetchMenuItems();
  }

  void _fetchMenuItems() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('cart').get();
    setState(() {
      _menuItems = querySnapshot.docs;
    });
  }

  void _addToCart(DocumentSnapshot menuItem) {
    setState(() {
      _cartItems.add(menuItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Food Cart'),
      ),
      body: _menuItems.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _menuItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_menuItems[index]['Name']),
                  subtitle: Text(_menuItems[index]['desc']),
                  trailing: Text('₹${_menuItems[index]['Price']}'),
                  onTap: () {
                    _addToCart(_menuItems[index]);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentScreen()),
          );
        },
        label: Text('Cart (${_cartItems.length})'),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}
