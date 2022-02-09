import 'package:capstone/screens/authentication/sign_in/widgets/body.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final ButtonStyle _elvButtonStyle = elvButtonStyle;
  // final ButtonStyle _txtButtonStyle = txtButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const NavigationDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFB6CFEC),
        elevation: 0.0,
        actions: [
          IconButton(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidthPercentage(context, percentage: 0.1),
              vertical: 0,
            ),
            onPressed: () async {
              _singInAnonymously();
            },
            tooltip: 'go with anonymously',
            icon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
      ),
      //extendBodyBehindAppBar: true,
      body: const Body(),
    );
  }

  _singInAnonymously() async {
    await widget._auth.signInAnonymously();
    Navigator.pushReplacementNamed(context, '/home');
  }

/*  Widget _closeButton() {
    return Positioned(
      top: 120.0,
      right: 20,
      // height: 25.0,
      // width: 25.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      height: 45.0,
      alignment: Alignment.bottomRight,
      child: TextButton(
        style: txtButtonStyle,
        onPressed: () => print('Forgot Password Button Pressed'),
        child: const Text(
          'Forgot Password?',
          style: labelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 45.0,
      alignment: Alignment.bottomLeft,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.black,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          const Text(
            'Remember me',
            style: labelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return LoginButton(
      buttonText: 'LOGIN',
      onPressedFunction: validFunction,
    );
  }

  void validFunction() {
    final form = formKey.currentState!;

    if (form.validate()) {
      // final email = emailController.selection.;

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('Your email is $email'),
        ));
    }
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen())),
      // onTap: () => print('routed to Sign-up page'),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }*/
}
/*leading: Padding(
          padding: EdgeInsets.only(
            left: screenWidthPercentage(context,percentage: 0.05)
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back,size: 30.0,),
            onPressed: () {},
          ),
        ),*/
/*   Container(
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
                ),*/
/*colors: [
  Color(0xFF73AEF5),
  Color(0xFF61A4F1),
  Color(0xFF478DE0),
  Color(0xFF398AE5),
  ],*/
/*Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: labelStyle,
        ),
        // const SizedBox(height: 5.0),
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
        verticalSpaceTiny,
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 50.0,
          child: const TextField(
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

/*Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: elvButtonStyle,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
        // onPressed: () => print('Login Button Pressed'),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }*/

/*Widget _buildSignInWithText() {
    return Column(
      children: const <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        // SizedBox(height: 20.0),
        verticalSpaceLarge,
        Text(
          'Sign in with',
          style: labelStyle,
        ),
      ],
    );
  }*/

/*Widget _buildSocialBtn(Function _onTap, AssetImage logo) {
    return GestureDetector(
      onTap: () => _onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }*/

/*Widget _buildSocialBtnRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            const AssetImage(
              'assets/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            const AssetImage(
              'assets/google.jpg',
            ),
          ),
        ],
      ),
    );
  }*/

/*


child: TextButton(
                  onPressed: () => print('pressed'),
                  child: Wrap(
                    children: const <Widget>[
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 25.0,
                      ),
                      Text(
                          'go without sign',
                          style: kLabelStyle,
                      ),
                    ],
                  )
                )
child: Wrap(
                  children: <Widget>[
                    TextButton(
                      onPressed: () => print('pressed'),
                      style: _txtButtonStyle,
                      icon: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                    Text('go with anonymous'),
                  ]
                ),
onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => const SignupScreen()));
                },
child: Icon(
                  Icon.arrow,
                )
child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 40,
                color: Color(0xBE385C89),
                //semanticLabel: 'go without sign',
              ),

GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const SignupScreen()),);
              },

Positioned(
                top: 120.0,
                right: 20,
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
              )*/
