import 'dart:io';

import 'package:capstone/utilities/constants.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/utilities/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

/*   void getData() async {

    // Response response = await get(Uri.http('jsonplaceholder.typicode.com', '/todos/1' ));
    Response response = await get(Uri.http('worldtimeapi.org', 'api/timezone/Europe/Istanbul' ));
    Map data = jsonDecode(response.body);
    // print('$data\n\n');
    String timezone = data['timezone'];
    String utc_datetime = data['utc_datetime'];

    String offset = data['utc_offset'].substring(1,3);
    print('${data['utc_offset']}  ''  ${offset}');
    String datetime = data['datetime'];
    print('timezone: $timezone''\nutc_datetime: $utc_datetime''\ndatetime: $datetime');

    DateTime now = DateTime.parse(datetime);
    print('\nBefore DateTime datetime: ${now}');

    now = now.add(Duration(hours: int.parse(offset)));
    print('After  DateTime datetime: ${now}');
}


  @override
  void initState() {
    super.initState();
    getData();
  }
 */


  @override
  Widget build(BuildContext context) {

    List<Widget> profileLabels = [
      // verticalSpaceTiny,
      Container(
        // color: Colors.black12,
        padding: const EdgeInsets.fromLTRB(15, 10, 0, 15),
        child: Text(
          'USER INFORMATION',
          style: appBarTitleStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          textAlign: TextAlign.left,
        ),
      ),
/*      menuBuilder(
        title: '${UserPreferences.myUser.firstName}',
        // iconData: Icons.person_outline,
        navPath: () => Navigator.pushNamed(context, '/profile'),
      ),
      menuBuilder(
        title: '${UserPreferences.myUser.lastName}',
        // iconData: Icons.favorite_border,
        navPath: () => Navigator.pushNamed(context, '/cart'),
      ),
      // buildDivider(context),
      menuBuilder(
        title: '${UserPreferences.myUser.email}',
        // iconData: Icons.shopping_cart_outlined,
        navPath: () => Navigator.pushNamed(context, '/cart'),
      ),
      // buildDivider(context),
      menuBuilder(
        title: '${UserPreferences.myUser.phoneNumber}',
        // iconData: Icons.settings_rounded,
        navPath: () => Navigator.pushNamed(context, '/settings'),
      ),*/
      // buildDivider(context),
      TextFormField(
        // enableInteractiveSelection: false,
        // readOnly: true,
        enabled: false,
        style: fieldTextStyle,
        cursorColor: Colors.white,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

        // controller: firstNameController,

        validator: (value) => value != null && (value.length > 50 || value.isEmpty)
            ? 'Name length must be between 1-50 characters'
            : null,

        onSaved: (newValue) {
          setState(() {
            UserPreferences.myUser.firstName = newValue;
          });
        },

        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: '${UserPreferences.myUser.firstName}',
          labelStyle: TextStyle(color: Colors.black),

/*          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid,width: 2)
          ),*/
          border: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(25, 25, 0, 5),
/*          prefixIcon: const Icon(
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
          hintStyle: hintTextStyle,*/
        ),
      ),
      TextFormField(
        readOnly: true,
        enabled: false,
        cursorColor: Colors.white,
        style: fieldTextStyle,
        keyboardType: TextInputType.name,

        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

        // controller: lastNameController,

        validator: (value) => value != null && (value.length > 50 || value.isEmpty)
            ? 'Name length must be between 1-50 characters'
            : null,

        onSaved: (newValue) {
          setState(() {
            UserPreferences.myUser.lastName = newValue;
          });
        },

        decoration: InputDecoration(
          labelText: '${UserPreferences.myUser.lastName}',
          labelStyle: TextStyle(color: Colors.black),

          border: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(25, 25, 0, 5),

/*          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid,width: 2)
          ),*/
          // contentPadding: EdgeInsets.only(top: 10.0),
/*          prefixIcon: const Icon(
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
          hintStyle: hintTextStyle,*/
        ),
      ),
      TextFormField(
        readOnly: true,
        enabled: false,
        cursorColor: Colors.white,
        style: fieldTextStyle,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

        // controller: emailController,

/*        onChanged: (value) {
*//*                if (emailValidatorRegExp.hasMatch(value)) {
                  setState(() {
                    random = Random().nextInt(100 - 15);
                  });
                  print('onChange' + '---' + '$random');
                }*//*

          if (EmailValidator.validate(value)) {
            setState(() {
              // newUser.email = value;
            });
          }
        },*/

        // onSaved: (newValue) => myUser.email = email,
        onSaved: (newValue) {
          setState(() {
            UserPreferences.myUser.email = newValue;
          });
        },
 /*       validator: (email) =>
        email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,*/

        decoration: InputDecoration(
          labelText: '${UserPreferences.myUser.email}',
          labelStyle: TextStyle(color: Colors.black),

          border: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(25, 25, 0, 5),

/*
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid,width: 2)
          ),*/
/*          prefixIcon: const Icon(
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
          hintText: 'Enter your Email',
          hintStyle: hintTextStyle,*/
/*                suffixIcon: emailController.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => emailController.clear(),
                      ),*/
        ),
      ),
      TextFormField(
        readOnly: true,
        enabled: false,
        // focusNode: focusNodePhone,
        style: fieldTextStyle,
        cursorColor: Colors.white,
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        // controller: phoneNumberController,
        maxLength: 11,

        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],

        // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(focusNodeAddress),

        onSaved: (newValue) {
          setState(
                () {
              // int phoneInt = int.parse(newValue!),
              UserPreferences.myUser.phoneNumber = int.parse(newValue!);
            },
          );
        },
        validator: (val) => val != null && val.length != 11 ? 'Enter 11 digit' : null,
        decoration: InputDecoration(
          labelText: '${UserPreferences.myUser.phoneNumber}',
          labelStyle: TextStyle(color: Colors.black),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
         /* border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid,width: 2)
          ),*/
          border: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(25, 25, 0, 5),

          // contentPadding: EdgeInsets.only(top: 10.0),
/*          prefixIcon: const Icon(
            Icons.phone_iphone,
            color: Colors.white,
          ),

          suffixIcon: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white54,
            ),
            onPressed: () => phoneNumberController.clear(),
          ),
          hintText: 'Enter your Phone Number',
          hintStyle: hintTextStyle,*/
        ),
      ),
      InkWell(
        onTap: () => Navigator.pushNamed(context, '/'),
        child: Container(
          height: screenHeightPercentage(context,percentage: 0.125),
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
          child: Text(
            '${UserPreferences.myUser.about}',
            overflow: TextOverflow.fade,
            maxLines: 4,
            // iconData: Icons.logout,
            // navPath: () => Navigator.pushNamed(context, '/'),
          ),
        ),
      ),
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => profileLabels[index],
        childCount: profileLabels.length,
      ),
    );
  }

  Widget menuBuilder({required String title, required Function() navPath}) {
    return SimpleSettingsTile(
      // leading: iconWidget(iconData),
      title: title,
      subtitle: '',
      onTap: navPath,
      enabled: true,
      // child: SettingsScreen(),
    );
  }


}
