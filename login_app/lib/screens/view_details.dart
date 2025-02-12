import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewDetailsScreen extends StatefulWidget {
  @override
  _ViewDetailsScreenState createState() => _ViewDetailsScreenState();
}

class _ViewDetailsScreenState extends State<ViewDetailsScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          userData = userDoc.data() as Map<String, dynamic>;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: userData == null
            ? CircularProgressIndicator(color: Colors.blueAccent)
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 100, color: Colors.blueAccent),
                    SizedBox(height: 20),
                    Text(
                      "User Details",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    buildDetailText("Name", userData!['name']),
                    buildDetailText("Age", userData!['age'].toString()),
                    buildDetailText("Gender", userData!['gender']),
                    buildDetailText("Mobile", userData!['mobile']),
                  ],
                ),
              ),
      ),
    );
  }

  Widget buildDetailText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        "$label: $value",
        style: TextStyle(fontSize: 18, color: Colors.white70),
      ),
    );
  }
}
