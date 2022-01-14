import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/utilities/utility_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController controller;

  const EmailTextField({Key? key, required this.controller}) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: labelStyle,
        ),
        // const SizedBox(height: 5.0),
        verticalSpaceTiny,
        /*Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 50.0,

          child: buildTextFormField(),
        ),*/
        Stack(
          children: [
            Container(
              // alignment: Alignment.centerLeft,
              decoration: boxDecorationStyle,
              height: 50.0,
              // child: buildTextFormField(),
            ),
            TextFormField(
              cursorColor: Colors.white,
              controller: widget.controller,
              keyboardType: TextInputType.emailAddress,
              style: hintTextStyle,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                hintStyle: hintTextStyle,
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
                  onPressed: () => widget.controller.clear(),
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
}
