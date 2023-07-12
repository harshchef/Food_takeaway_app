import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hungreez/reusablecard.dart';

// class EmployeeResuable extends StatefulWidget {
//   EmployeeResuable({Key? key}) : super(key: key);
//   EmployeeResuable({

//     required this.Salary;
//     required this.empId;
//     required this.documentId
//   });

//   // final String empId;
//   final String EmpName;
//   final String Salary;
//   final String documentId;
//   @override
//   State<EmployeeResuable> createState() => _EmployeeResuableState();
// }

// class _EmployeeResuableState extends State<EmployeeResuable> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class EmployeeResuable extends StatelessWidget {
  EmployeeResuable({
    required this.Salary,
    required this.empId,
    required this.documentId,
  });
  final String empId;
  final String Salary;
  final String documentId;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        // use async-await to wait for data from Firestore
        try {
          final documentSnapshot = await FirebaseFirestore.instance
              .collection('Employee')
              .doc(documentId)
              .get(); // get the document snapshot for the specified document ID
          if (documentSnapshot.exists) {
            final data = documentSnapshot.data() as Map<String, dynamic>;
            // get the values from the document snapshot
            final value1 = data['Salary'];
            final value2 = data['dob'];
            final value3 = data['empId'];
            final value4 = data['empName'];

            // navigate to the next screen with the retrieved data
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmployeeScreen(
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
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Name:-" + empId,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Salary of Employee:- " + Salary,
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
    ;
  }
}

class EmployeeScreen extends StatelessWidget {
  EmployeeScreen({
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
              'Employee',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            // decoration: BoxDecoration(
            //   color: Colors.green,
            //   image: DecorationImage(
            //     fit: BoxFit.fill,
            //     image: AssetImage('assets/images/abc.jpg'),
            //   ),
            // ),
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('EmpId:    ₹ $value1'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('EmpNAme:    ₹ $value2'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Salary:   ₹ $value3'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('DOB:   ₹ $value4'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
