import 'package:capstone/screens/sign_up_post/widgets/body.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:flutter/material.dart';

class SignUpPost extends StatelessWidget {
  const SignUpPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFB6CFEC),
      // backgroundColor: Colors.transparent,
      leading: IconButton(
        padding: EdgeInsets.only(left: screenWidthPercentage(context, percentage: 0.1)),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xBE385C89),
        ),
        constraints: const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
        tooltip: 'go back',
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          tooltip: 'be guest',
          padding: EdgeInsets.only(right: screenWidthPercentage(context, percentage: 0.135)),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          icon: const Icon(
            Icons.close,
            size: 32,
            color: Color(0xBE385C89),
          ),
        )
/*        ElevatedButton(

        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          Navigator.pushNamed(context, '/home');
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(right: screenWidthPercentage(context, percentage: 0.1)),

          elevation: 0.0,
          //padding: const EdgeInsets.all(15.0),
          primary: Colors.transparent,
        ),
        child: const Icon(
          Icons.close_outlined,
          size: 32,
          color: Color(0xBE385C89),
          //semanticLabel: 'go without sign',
        ),
      ),*/
      ],
    );
  }
}
