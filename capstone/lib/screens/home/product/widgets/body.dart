import 'package:capstone/utilities/spacing.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      /*          child: Container(
            // height: double.infinity,
            // width: double.infinity,
            height: screenHeight(context),
            width: screenWidth(context),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFB6CFEC),
                  Color(0xFF8BAACE),
                  Color(0xFF6788AC),
                  Color(0xFF37485C),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),*/
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: screenHeight(context),
            width: screenWidth(context),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
