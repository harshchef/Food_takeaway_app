import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hungreez/MenuScreen.dart';
import 'package:hungreez/constants.dart';
import 'package:hungreez/pay_gate.dart';
import 'package:hungreez/reusablecard.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RestaurantScreen extends StatefulWidget {
  RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final user = FirebaseFirestore.instance;

  List<String> docID = [];
// get docIDS
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('cafe').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docID.add(document.reference.id);
          }),
        );
  }

  // @override
  // void initState() {
  //   getDocId();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            Navigator.push(
              context,
           
              MaterialPageRoute(builder: (context) => FoodCartScreen()),
            );
          },
          child: Icon(Icons.payment),
        ),
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Hungreez"),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: SafeArea(
          child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: docID.length,
                    itemBuilder: (context, index) {
                      return Reusablecard(
                        documentId: docID[index],
                        location: "VIT Vellore",
                        img: "assets/images/abc(2).jpg",
                        cafename: docID[index],
                      );
                      // return ListTile(
                      //   title: Text(docID[index]),
                      // );
                    });
              }),

          // child: Column(
          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     SizedBox(height: 28),
          //     Reusablecard(
          //       name: "PRP",
          //       img: "assets/images/abc(2).jpg",
          //       eventname: "DC Court",
          //     ),
          //     Reusablecard(
          //       name: "SMV",
          //       img: "assets/images/abc.jpg",
          //       eventname: "FC food court",
          //     ),
          //     Reusablecard(
          //       name: "GDN",
          //       img: "assets/images/abc(1).jpg",
          //       eventname: "Tara Maa",
          //     ),
          //     Reusablecard(
          //       name: "MB",
          //       img: "assets/images/abc(3).jpg",
          //       eventname: "Limra",
          //     ),
          //     Reusablecard(
          //       name: "SJT",
          //       img: "assets/images/abc(4).jpg",
          //       eventname: "Araasan",
          //     ),
          //     Reusablecard(
          //       name: "Men's Hostel",
          //       img: "assets/images/abc(5).jpg",
          //       eventname: "US Pizzeria",
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "GDN canteen",
    "DC court",
    "FC Court",
    "Araasan",
    "Food Court"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)),
      // TODO: implement buildActions
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading

    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var hotel in searchTerms) {
      if (hotel.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(hotel);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        ); // ListTile
      },
    ); // ListView.builder
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var hotel in searchTerms) {
      if (hotel.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(hotel);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        ); // ListTile
      },
    ); // ListView.builder
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
