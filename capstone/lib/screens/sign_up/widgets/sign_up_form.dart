// import 'package:capstone/models/user.dart';
import 'package:capstone/utilities/constants.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/utilities/user_preferences.dart';
import 'package:capstone/widgets/loginButton.dart';
import 'package:capstone/widgets/text_field_container.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isHidden = true;
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  // User newUser = UserPreferences.myUser;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      /*final String text =emailController.text.toUpperCase();
      emailController.value = emailController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length-9, extentOffset: text.length-2),
        composing: TextRange.empty,
      );*/
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFirstNameTF(),
          verticalSpaceSmall,
          buildLastNameTF(),
          verticalSpaceSmall,
          buildEmailTextField(),
          verticalSpaceSmall,
          buildPasswordTextField(),
          verticalSpaceMedium,
          buildLoginBtn(),
        ],
      ),
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
        Stack(
          children: [
            const TextFieldContainer(),
            TextFormField(
              style: fieldTextStyle,
              cursorColor: Colors.white,
              obscureText: isHidden,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              controller: passwordController,

              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
              onSaved: (newValue) {
                setState(() {
                  UserPreferences.myUser.password = newValue;
                });
              },
              validator: (password) => password != null && password.length < 5 ? 'Enter min. 5 characters' : null,
              decoration: InputDecoration(
                // floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Enter your Password',
                hintStyle: fieldTextStyle,
                border: InputBorder.none,
                // contentPadding: EdgeInsets.only(top: 10.0),
                prefixIcon: const Icon(
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
        ),
      ],
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

              controller: emailController,

              onChanged: (value) {
/*                if (emailValidatorRegExp.hasMatch(value)) {
                  setState(() {
                    random = Random().nextInt(100 - 15);
                  });
                  print('onChange' + '---' + '$random');
                }*/

                if (EmailValidator.validate(value)) {
                  setState(() {
                    // newUser.email = value;
                  });
                }
              },

              // onSaved: (newValue) => myUser.email = email,
              onSaved: (newValue) {
                setState(() {
                  UserPreferences.myUser.email = newValue;
                });
              },
              validator: (email) =>
                  email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,

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
                  onPressed: () => emailController.clear(),
                ),
/*                suffixIcon: emailController.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => emailController.clear(),
                      ),*/
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildFirstNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'First Name',
          style: labelStyle,
        ),
        verticalSpaceTiny,
        Stack(
          children: <Widget>[
            const TextFieldContainer(),
            TextFormField(
              style: fieldTextStyle,
              cursorColor: Colors.white,
              keyboardType: TextInputType.name,

              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

              controller: firstNameController,

              validator: (value) => value != null && (value.length > 50 || value.isEmpty)
                  ? 'Name length must be between 1-50 characters'
                  : null,

              onSaved: (newValue) {
                setState(() {
                  UserPreferences.myUser.firstName = newValue;
                });
              },

              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 10.0),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white54,
                  ),
                  onPressed: () => firstNameController.clear(),
                ),
                hintText: 'Enter your First Name',
                hintStyle: fieldTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildLastNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Last Name',
          style: labelStyle,
        ),
        verticalSpaceTiny,
        Stack(
          children: <Widget>[
            const TextFieldContainer(),
            TextFormField(
              cursorColor: Colors.white,
              style: fieldTextStyle,
              keyboardType: TextInputType.name,

              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

              controller: lastNameController,

              validator: (value) => value != null && (value.length > 50 || value.isEmpty)
                  ? 'Name length must be between 1-50 characters'
                  : null,

              onSaved: (newValue) {
                setState(() {
                  UserPreferences.myUser.lastName = newValue;
                });
              },

              decoration: InputDecoration(
                border: InputBorder.none,
                // contentPadding: EdgeInsets.only(top: 10.0),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white54,
                  ),
                  onPressed: () => firstNameController.clear(),
                ),
                hintText: 'Enter your Last Name',
                hintStyle: fieldTextStyle,
              ),
            ),
          ],
        ),
/*        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 50.0,
          child: const TextField(
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            style: fieldTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              // contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
              ),
              hintText: 'Enter your Last Name',
              hintStyle: fieldTextStyle,
            ),
          ),
        ),*/
      ],
    );
  }

  Widget backAndClose() {
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

  Widget _closeButton() {
    return ElevatedButton(
      onPressed: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        Navigator.pushNamed(context, '/home');
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

  Widget buildLoginBtn() {
    return LoginButton(
      buttonText: 'Continue',
      onPressedFunction: validFunction,
    );
  }

  void validFunction() {
    final form = formKey.currentState!;

    if (form.validate()) {
      // final emailss = emailController.text;
      form.save();
      // final email = emailController.selection.;
      // print(controller.text + '---' + controller.text + '\n');
      print('First Name: ' +'${UserPreferences.myUser.firstName}' +
          '\nLast Name: ' +'${UserPreferences.myUser.lastName}' +
          '\nEmail: ' +'${UserPreferences.myUser.email}'+
          '\nPassword: '+'${UserPreferences.myUser.password}');

      Navigator.pushNamed(context, '/signuppost');
      // print('${emailController.text}');
      /*ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('Your email is $email'),
        ));*/

    }
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);

}
