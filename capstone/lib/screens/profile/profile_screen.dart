import 'package:flutter/material.dart';
import 'package:capstone/widgets/navigationDrawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
/*      appBar: AppBar(
        backgroundColor: Color(0xFF527DAA),
        title: Text('Your Profile'),
        centerTitle: true,
        elevation: 0,
      ),*/
      drawer: NavigationDrawer(),
      bottomNavigationBar: NavigationDrawer(),
      body: SafeArea(
        child: Container(
          color: Colors.indigo[200],
        ),
      ),
    );
  }
}
