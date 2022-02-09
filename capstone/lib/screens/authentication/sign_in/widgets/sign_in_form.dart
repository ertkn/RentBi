import 'package:capstone/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:capstone/utilities/constants.dart';
import 'package:capstone/utilities/snackbar.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/utilities/user_preferences.dart';
import 'package:capstone/widgets/text_field_container.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // u.User newUser = UserPreferences.myUser;
  bool? _rememberMe = false;

  // String? email;
  bool isHidden = true;
  bool isValidate = false;
  bool _isSuccess = false;

  // bool val = false;

  // final passwordController = TextEditingController();
  // final emailController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // passwordController.dispose();
    // emailController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          buildEmailTextField(),
          verticalSpaceSmall,
          buildPasswordTextField(),
          verticalSpaceTiny,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildRememberMeCheckbox(),
              buildForgotPasswordBtn(),
            ],
          ),
          verticalSpaceTiny,
          buildLoginButton(),
          verticalSpaceRegular,
          buildSignupBtn(),
        ],
      ),
    );
  }

  Widget buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: labelStyle,
        ),
        verticalSpaceTiny,
        Stack(
          children: [
            const TextFieldContainer(),
            TextFormField(
              cursorColor: Colors.white,
              style: fieldTextStyle,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

              controller: _emailController,

/*              onChanged: (value) {
                if (emailValidatorRegExp.hasMatch(value)) {
                  setState(() {
                    random = Random().nextInt(100 - 15);
                  });
                  print('onChange' + '---' + '$random');
                }

                if (EmailValidator.validate(value)) {
                  setState(() {
                    // newUser.email = value;
                  });
                }
              },*/

              // onSaved: (newValue) => myUser.email = email,
              onSaved: (newValue) {
                setState(() {
                  // newUser.email = newValue;
                  UserPreferences.myUser.email = newValue;
                });
              },

              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null,

              decoration: InputDecoration(
                hintText: 'Enter your Email',
                hintStyle: fieldTextStyle,
                border: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white54,
                  ),
                  onPressed: () => _emailController.clear(),
                ),
/*              suffixIcon: widget.controller.text.isEmpty
                ? Container(width: 0)
                : IconButton(
              icon: Icon(Icons.close),
              onPressed: () => widget.controller.clear(),
            ),*/
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: labelStyle,
        ),
        verticalSpaceTiny,
        /*Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            // autofillHints: const [AutofillHints.password],
            // onEditingComplete: () => TextInput.finishAutofillContext(),
            controller: widget.controller,
            maxLength: 24,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isHidden,
            style: hintTextStyle,
            validator: (password) => password != null && password.length<5
                ? 'Enter min. 5 characters'
                : null,

            decoration: InputDecoration(
              hintText: 'Enter your Password',
              hintStyle: hintTextStyle,
              border: InputBorder.none,
              // contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: const Icon(
                // Icons.email,
                Icons.lock,
                color: Colors.white,
              ),

              suffixIcon: IconButton(
                icon: isHidden
                    ? const Icon(
                        Icons.visibility_off,
                        color: Colors.white54,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: Colors.white70,
                      ),
                onPressed: togglePasswordVisibility,
              ),
            ),
          ),
        ),*/
        Stack(
          children: [
            const TextFieldContainer(),
            TextFormField(
              controller: _passwordController,
              style: fieldTextStyle,
              cursorColor: Colors.white,
              obscureText: isHidden,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),

              onSaved: (newValue) {
                setState(() {
                  // newUser.password = newValue;
                  UserPreferences.myUser.password = newValue;
                });
              },

              // onChanged: (value) => setState(() => password = value),
              // autofillHints: const [AutofillHints.password],
              // onEditingComplete: () => TextInput.finishAutofillContext(),
              // controller: widget.controller,
              // maxLength: 24,

              validator: (password) => password != null && password.length < 8
                  ? 'Enter min. 8 characters'
                  : null,

              decoration: InputDecoration(
                // floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Enter your Password',
                hintStyle: fieldTextStyle,
                border: InputBorder.none,
                // contentPadding: EdgeInsets.only(top: 10.0),
                prefixIcon: const Icon(
                  // Icons.email,
                  Icons.lock,
                  color: Colors.white,
                ),

                suffixIcon: IconButton(
                  icon: isHidden
                      ? const Icon(
                          Icons.visibility_off,
                          color: Colors.white54,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: Colors.white70,
                        ),
                  onPressed: togglePasswordVisibility,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);

  Widget buildForgotPasswordBtn() {
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

  Widget buildRememberMeCheckbox() {
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

/*
  Widget buildLoginBtn() {
    return LoginButton(
      buttonText: 'LOGIN',
      onPressedFunction: validFunction,
    );
  }
*/

  Container buildLoginButton() {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: elvButtonStyle,
        /*onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        ),*/
        onPressed: () async {
          final form = formKey.currentState!;
          if (form.validate()) {
            form.save();
            // print(_emailController.text);
            // print(_passwordController.text);
            _signIn();

            // validFunction();
/*             val = (await buildDialog())!;
            if(val == true){
              print('goes to registered');
              await _registerWithEmailNPassword();
            }*/

/*            buildDialog().then((_) {
              if(isValidate == true){
                print('goes to registered');
                _registerWithEmailNPassword();
              }
            });*/

            print('out to registered: ${isValidate.toString()}');
            // print('BuildDialog: ${buildDialog()}');
            // _registerWithEmailNPassword();
          }
        },
        // onPressed: () => print('Login Button Pressed'),
        child: const Text(
          'LOGIN',
          style: buttonTextStyle,
        ),
      ),
    );
  }

  void _signIn() async {
    try{
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final User user = userCredential.user!;
      _isSuccess =true;
      SnackBarMessage.showSnackBar(context, text: 'welcome back ${UserPreferences.myUser.firstName}',);
      Navigator.pushReplacementNamed(context, '/home');

    }on FirebaseAuthException catch(e){
      _isSuccess = false;
      SnackBarMessage.showSnackBar(context, text: 'ouch an error catched! ${e.message}',);
    }
    catch(e){
      _isSuccess = false;
      SnackBarMessage.showSnackBar(context, text: 'ouch an error catched!! ${e.toString()}',);
      debugPrint(e.toString());
    }
  }

/*  buildDialog() async {
    await showDialog<bool>(
      context: context,
      builder: (context) => buildAlertDialog(),
      barrierDismissible: false,
    );
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      content: Text('Do you validate this records'),
      title: const Text('Confirm'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  isValidate = true;
                  Navigator.of(context).pop(isValidate);
                });
              },
              child: const Text('YES'),
            ),
            TextButton(
              onPressed: () {
                isValidate = false;
                Navigator.of(context).pop(isValidate);
              },
              child: const Text('NO'),
            ),
          ],
        ),
      ],
    );
  }

  Future _registerWithEmailNPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: UserPreferences.myUser.email!,
        password: UserPreferences.myUser.password!,
      );
      final User user = userCredential.user!;

      if (user != null) {
        setState(() {
          _isSuccess = true;
          SnackBarMessage.showSnackBar(context,
              text: 'Register accomplished\n\n'
                  '${user.uid}\t'
                  '${UserPreferences.myUser.firstName} '
                  '${UserPreferences.myUser.lastName}');
        });
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          _isSuccess = false;
          SnackBarMessage.showSnackBar(context,
              text: 'register, it seems failed..');
        });
      }
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        _isSuccess = false;
        SnackBarMessage.showSnackBar(context,
            text: 'ouch!! register is failed!\n\n$e');
      });
    }
  }*/

/*  void validFunction() {
    final form = formKey.currentState!;

    if (form.validate()) {
      // formKey.currentState!.save();
      form.save();
      // final email = emailController.selection.;
      // print(controller.text + '---' + controller.text + '\n');

      _loginUser();

      print('First Name: ' +
          '${UserPreferences.myUser.firstName}' +
          '\nLast Name: ' +
          '${UserPreferences.myUser.lastName}' +
          '\nEmail: ' +
          '${UserPreferences.myUser.email}' +
          '\nPassword: ' +
          '${UserPreferences.myUser.password}');

      Navigator.pushReplacementNamed(context, '/home');
      */ /*ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('Your email is $email'),
        ));*/ /*
    }
  }

  _loginUser() async {
    (await _auth);

  }*/

  Widget buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignupScreen())),
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

/*
Widget _closeButton() {
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
}*/

/*

  PasswordTextField buildPasswordTextFieldd() =>
      PasswordTextField(controller: controller);
*/

/*
  EmailTextField buildEmailTextField() {
    return  EmailTextField(controller: controller);
  }
*/
