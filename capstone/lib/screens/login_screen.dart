import 'package:capstone/screens/home_screen.dart';
import 'package:capstone/screens/register_screen.dart';
import 'package:capstone/widgets/emailTF.dart';
import 'package:capstone/widgets/loginBTN.dart';
import 'package:capstone/widgets/passwordTF.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:flutter/material.dart';
import 'package:capstone/utilities/utility_constants.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? _rememberMe = false;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  // final ButtonStyle _elvButtonStyle = elvButtonStyle;
  // final ButtonStyle _txtButtonStyle = txtButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const NavigationDrawer(),
      /*appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 27.0,top: 50.0,bottom: 0),
          child: IconButton(
            icon:  Icon(Icons.arrow_back,size: 30.0,),
            onPressed: () {},
          ),
        ),
      ),*/
      //extendBodyBehindAppBar: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
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
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 145.0,
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Sign In',
                          style: subtleStyle,
                        ),
                        verticalSpaceSmall,
                        EmailTextField(controller: emailController),
                        verticalSpaceSmall,
                        PasswordTextField(controller: passwordController),
                        // verticalSpaceTiny,
                        Row(
                            //height: 25.0,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            //padding: EdgeInsets.symmetric(horizontal: 0),
                            children: <Widget>[
                              _buildRememberMeCheckbox(),
                              _buildForgotPasswordBtn(),
                            ]),
                        _buildLoginBtn(),
                        verticalSpaceRegular,
                        _buildSignupBtn(),
                      ],
                    ),
                  ),
                ),
              ),
              _closeButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _closeButton(){
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
    return ButtonWidget(
      buttonText: 'LOGIN',
      onPressedFunction: validFunction,
    );
  }

  void validFunction(){
    final form = formKey.currentState!;

    if (form.validate()) {
      // final email = emailController.selection.;

      /*ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('Your email is $email'),
        ));*/
    }
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen())),
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
  }
}

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
