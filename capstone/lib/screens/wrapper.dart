import 'package:capstone/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:capstone/screens/home/product/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

/*  void routeIfUserLoggedIn() async {
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => _auth.currentUser == null
            ?  LoginScreen()
            :  HomeScreen(),
      ),
    );
  }*/

  void routeScreen() => _auth.currentUser == null
      ? Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()))
      : Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()));

  @override
  void initState() {
    super.initState();
    // routeIfUserLoggedIn();
    // print(_auth.currentUser.toString());
    Future.delayed(const Duration(milliseconds: 750)).then((_) => routeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xBE244D80),
      body: Center(
        child: SpinKitFadingCircle(
          duration: const Duration(milliseconds: 1200),
          itemBuilder: (BuildContext context, int index) {
            return  const DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                // color: index.isEven ? Colors.red : Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}
