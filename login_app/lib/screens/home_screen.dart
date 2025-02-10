import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'welcome_screen.dart'; // Import Welcome Page

class HomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logout(BuildContext context) async {
    bool confirmLogout = await showLogoutDialog(context);
    if (confirmLogout) {
      await _auth.signOut();
      Fluttertoast.showToast(
          msg: "Logged Out Successfully", backgroundColor: Colors.blueAccent);

      // Navigate to Welcome Screen and remove all previous screens
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
        (route) => false, // Removes all previous routes
      );
    }
  }

  Future<bool> showLogoutDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Logout", style: TextStyle(color: Colors.white)),
            content: Text("Are you sure you want to log out?",
                style: TextStyle(color: Colors.white70)),
            backgroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child:
                    Text("Cancel", style: TextStyle(color: Colors.blueAccent)),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child:
                    Text("Logout", style: TextStyle(color: Colors.redAccent)),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? user = _auth.currentUser;

    // Get the user's name or email if the name is null
    String userName = user?.displayName ?? user?.email ?? "User";

    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 100, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text(
              "Hi, $userName! You are successfully logged in.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Enjoy your stay!",
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            SizedBox(height: 30),

            // Logout Button with Modern Styling
            ElevatedButton.icon(
              onPressed: () => logout(context),
              icon: Icon(Icons.logout, color: Colors.white),
              label: Text("Logout",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
