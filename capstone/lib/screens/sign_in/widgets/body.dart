import 'package:capstone/screens/sign_in/widgets/sign_in_form.dart';
import 'package:capstone/utilities/constants.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: double.infinity,
            width: double.infinity,
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
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 100.0,
              ),
              child: Column(
                children: const [
                  Text(
                    'Sign In',
                    style: subtleStyle,
                  ),
                  verticalSpaceSmall,
                  SignInForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
