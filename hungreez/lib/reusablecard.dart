import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // import the cloud_firestore package

class Reusablecard extends StatelessWidget {
  Reusablecard({
    required this.location,
    required this.img,
    required this.cafename,
    required this.documentId, // add a new required parameter for document ID
  });

  final String location;
  final String img;
  final String cafename;
  final String documentId; // declare the new parameter

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        // use async-await to wait for data from Firestore
        try {
          final documentSnapshot = await FirebaseFirestore.instance
              .collection('cafe')
              .doc(documentId)
              .get(); // get the document snapshot for the specified document ID
          if (documentSnapshot.exists) {
            final data = documentSnapshot.data() as Map<String, dynamic>;
            // get the values from the document snapshot
            final value1 = data['Dosa'];
            final value2 = data['Idli'];
            final value3 = data['Noodles'];
            final value4 = data['Pasta'];

            // navigate to the next screen with the retrieved data
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuScreen(
                    value1: value1,
                    value2: value2,
                    value3: value3,
                    value4: value4),
              ),
            );
          } else {
            print('Document does not exist on Firestore');
          }
        } catch (e) {
          print('Error occurred while retrieving data from Firestore: $e');
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(blurRadius: 15, spreadRadius: 2),
              ],
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.fill),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Name:-" + cafename,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Location:- " + location,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  MenuScreen({
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
  });

  final String value1;
  final String value2;
  final String value3;
  final String value4;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Hungreez',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/abc.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Dosa:    ₹ $value1'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Idli:    ₹ $value2'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Noodles:   ₹ $value3'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Pasta:   ₹ $value4'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}

// // A new MenuScreen widget to display the retrieved data
// class MenuScreen extends StatelessWidget {
  // MenuScreen({
  //   required this.value1,
  //   required this.value2,
  // });

  // final String value1;
  // final String value2;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Menu Screen'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text('Value 1: $value1'),
//           Text('Value 2: $value2'),
//         ],
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:hungreez/nav.dart';
// import 'MenuScreen.dart';

// class Reusablecard extends StatelessWidget {
//   Reusablecard({
//     required this.location,
//     required this.img,
//     required this.cafename,
//   });

//   final String location;
//   final String img;
//   final String cafename;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => NavDrawer()));
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Container(
//             height: 120,
//             decoration: BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(blurRadius: 15, spreadRadius: 2),
//               ],
//             ),
//             margin: EdgeInsets.all(10),
//             padding: EdgeInsets.all(5),
//             child: Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Container(
//                     height: 90,
//                     width: 90,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage(img), fit: BoxFit.fill),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         "Name:-" + cafename,
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         "Location:- " + location,
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
