import 'package:capstone/screens/sign_up/widgets/body.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const NavigationDrawer(),
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFB6CFEC),
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
        ElevatedButton(
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
        ),
      ],
    );
  }
}

/*                    BuildTextField(
                    labelText: 'First Name',
                    textInputType: TextInputType.name,
                    iconType: Icons.account_circle_rounded,
                    hintText: 'Enter your First Name',
                    obscure: false,
                    // hintText: 'Enter your Email',
                  ),*/

/*Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: labelStyle,
        ),
        verticalSpaceTiny,
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 50.0,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            style: hintTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              // contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }*/

/*Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: labelStyle,
        ),
        verticalSpaceSmall,
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 50.0,
          child: const TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            style: hintTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              //contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }*/

/*Widget _closeButton() {
    return Positioned(
      top: 45.0,
      right: 25,
      // height: 25.0,
      // width: 25.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        style: ElevatedButton.styleFrom(
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
      ),
    );
  }*/
