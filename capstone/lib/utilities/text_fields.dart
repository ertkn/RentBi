import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/utilities/utility_constants.dart';
import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {

  String labelText;
  String hintText;
  bool obscure;
  TextInputType textInputType;
  IconData iconType;


  BuildTextField({
    Key? key,
    required this.labelText,
    required this.textInputType,
    required this.iconType,
    required this.hintText,
    required this.obscure,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labelText,
          style: labelStyle,
        ),
        // const SizedBox(height: 5.0),
        verticalSpaceTiny,
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle,
          height: 50.0,
          child: TextField(
            keyboardType: textInputType,
            obscureText: obscure,

/*            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),*/
            style: hintTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              // contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: Icon(
                // Icons.email,
                iconType,
                color: Colors.white,
              ),
              hintText: hintText,
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

