import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hungreez/employeresuable.dart';
import 'package:hungreez/reusablecard.dart';



class EmployeeScreen extends StatefulWidget {
  EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
    final user = FirebaseFirestore.instance;

  List<String> docID = [];
// get docIDS
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('Employee').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docID.add(document.reference.id);
          }),
        );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: 
        FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: docID.length,
                    itemBuilder: (context, index) {
                      return EmployeeResuable(
                        documentId: docID[index],
                        empId: "abc",
                        Salary: "9000",
                        // location: "VIT Vellore",
                        // img: "assets/images/abc(2).jpg",
                        // cafename: docID[index],
                      );
                      // return ListTile(
                      //   title: Text(docID[index]),
                      // );
                    });
              }),),
      ),
    );
  }
}
