// import 'package:flutter/cupertino.dart';
import 'package:capstone/screens/home_screen.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/widgets/emailTF.dart';
import 'package:capstone/widgets/loginBTN.dart';
import 'package:capstone/widgets/passwordTF.dart';
import 'package:capstone/utilities/utility_constants.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
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
            ),
            Container(
              // color: const Color(0x4a0d6279),
              height: double.infinity,
              // width: double.infinity,
/*              margin: const EdgeInsets.symmetric(
                horizontal: double.infinity,
                vertical: double.infinity,
              ),*/

              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(40, 50, 40, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // _buildBackButton(),
                      backAndClose(),
                      verticalSpaceSmall,
                      const Text(
                        'Create Account',
                        // textAlign: TextAlign.right,
                        style: subtleStyle,
                      ),
                      verticalSpaceTiny,
                      SizedBox(
                        width: screenWidthPercentage(context, percentage: 0.7),
                        child: Text(
                          'Enter your name, email and password for sign up',
                          // textAlign: TextAlign.right,
                          style: hintTextStyle.copyWith(
                            color: Color(0xBE244D80),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      verticalSpaceRegular,
                      _buildFirstNameTF(),
/*                    BuildTextField(
                        labelText: 'First Name',
                        textInputType: TextInputType.name,
                        iconType: Icons.account_circle_rounded,
                        hintText: 'Enter your First Name',
                        obscure: false,
                        // hintText: 'Enter your Email',
                      ),*/
                      verticalSpaceRegular,
                      _buildLastTF(),
                      verticalSpaceRegular,
                      PasswordTextField(controller: passwordController,),
                      // verticalSpaceSmall,
                      EmailTextField(controller: emailController),
                      verticalSpaceRegular,
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              ),
            ),
            // _closeButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'First Name',
          style: labelStyle,
        ),
        verticalSpaceTiny,
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 50.0,
          child: const TextField(
            keyboardType: TextInputType.name,
/*            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),*/
            style: hintTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              // contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Enter your Firs Name',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Last Name',
          style: labelStyle,
        ),
        verticalSpaceTiny,
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 50.0,
          child: const TextField(
            keyboardType: TextInputType.name,
/*            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),*/
            style: hintTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              // contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
              ),
              hintText: 'Enter your Last Name',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget backAndClose(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBackButton(),
        _closeButton(),
      ],
    );
  }

  Widget _buildBackButton() {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Color(0xBE385C89),
      ),
      constraints: const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
      tooltip: 'go back',
      onPressed: () => Navigator.pop(context),
    );
  }

  Widget _closeButton(){
    return ElevatedButton(
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
    );
  }


  Widget _buildLoginBtn() {
    return ButtonWidget(
      buttonText: 'LOGIN',
      onPressedFunction: validFunction,
    );
  }

  void validFunction(){
    final form = formKey.currentState!;

    if (form.validate()) {
      // final emailss = emailController.text;

      /*ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('Your email is $email'),
        ));*/

    }
  }
}


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