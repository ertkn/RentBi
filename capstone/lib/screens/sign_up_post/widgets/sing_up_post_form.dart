import 'package:capstone/models/categories.dart';
import 'package:capstone/utilities/constants.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/utilities/user_preferences.dart';
import 'package:capstone/widgets/loginButton.dart';
import 'package:capstone/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPostForm extends StatefulWidget {
  const SignUpPostForm({Key? key}) : super(key: key);

  @override
  _SignUpPostFormState createState() => _SignUpPostFormState();
}

class _SignUpPostFormState extends State<SignUpPostForm> {
  final phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // String selectedCountryItem = data[0].location.toString();

  String? selectedCountryItem;
  String selectedCountryItemNotNull = '';

  // int selectedCountryItemIndex = 0;
  Locations itemLocation = Locations();
  Locations itemLocationCity = Locations();

  // String selectedSublocationItem = data[[0]].location.toString();
  // String selectedCityItem = data[0].children![0].location.toString();

  String? selectedCityItem;
  String selectedCityItemNotNull = '';

  String? selectedDistrictItem;
  String selectedDistrictItemNotNull = '';

  // String selectedDistrictItem = data[0].children![0].sublocation![0].toString();

  List<bool> disableCityDropDown = [true, true];

  // List<List<String>> location_list = [{'istanbul':['pendik']}];
  //[{'istanbul':[{'pendik'}]}]
  @override
  void initState() {
    super.initState();
    phoneNumberController.addListener(() {
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
    phoneNumberController.dispose();
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          buildPhoneNoFormText(context),
          verticalSpaceMedium,
          buildCountryDropdownButton(),
          verticalSpaceMedium,
          buildCityDropdownButton(),
          verticalSpaceMedium,
          buildDistrictDropdownButton(),
          verticalSpaceMedium,
          buildLoginButton(),
          // DropdownButton(items: items, onChanged: onChanged)
        ],
      ),
    );
  }

  Container buildDistrictDropdownButton() {
    return Container(
      decoration: boxDecorationStyle,
      alignment: Alignment.center,
      width: screenWidthPercentage(context,percentage: 0.9),
      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 0),

      child: DropdownButtonHideUnderline(
        child: DropdownButton(

          // disabledHint: Text('asfasfasgsadghsh'),
          // focusColor: Colors.amber,
          // disabledHint: Text('district'),
          // underline: const SizedBox(),
        // decoration: InputDecoration(
        //     alignLabelWithHint: true,
        //     prefixIcon: Icon(Icons.location_city)
        //     // hintText: 'adfg'
        //   ),

/*          onTap: () {

          },*/
          isExpanded: true,
          borderRadius: BorderRadius.circular(10),
          hint: Text(
            'district',
            style: hintTextStyle.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.75,
            ),
          ),
          // menuMaxHeight: 150,
          itemHeight: 50,
          icon: const Icon(
            Icons.location_city,
            color: Colors.white,
          ),
          iconSize: 25,
          alignment: Alignment.centerLeft,
          elevation: 0,
          style: const TextStyle(fontSize: 16, color: Colors.black),
          dropdownColor: Color(0xFFFFFFFF),
          // onChanged: disableCityDropDown[1] ? null : (e) => setState(() => selectedDistrictItem = e.toString()),

          onChanged: (value) {
            if (disableCityDropDown[1] && selectedCityItem == null) {
              null;
            } else {
              setState(() {
                selectedDistrictItem = value.toString();
              });
            }
          },

          value: selectedDistrictItem,

          items: data[data.indexOf(returnDistrictIndexOf())]
              .children!
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item.sublocation.toString(),
                  child: Text(
                    item.location.toString(),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Locations returnCityIndexOf() {
    data.map((item) {
      // print('start' + item.toString());
      // print('selectedCountryItemNotNull:' + selectedCountryItemNotNull.toString());
      // print('item.location:' +item.location.toString());
      // print('IN/itemLocation:' +itemLocation.location.toString());
      if (item.location.toString().contains(selectedCountryItemNotNull.toString())) {
        // if(selectedCountryItemNotNull == ''){
        //   itemLocation = item;
        //   print('inner/itemLocation:' +itemLocation.location.toString());
        //   return itemLocation;
        // }
        // print('asd');
        // print('item: ' + item.toString());
        // print('item.location.toString(): ' + item.location.toString());
        // print('selectedCountryItem.toString(): ' + selectedCountryItemNotNull.toString());
        itemLocation = item;
        // print('IN/itemLocation:' +itemLocation.location.toString());
        // print('inner: ' + item.toString());
      }
      // return item;
    }).toList();
    // print('end: ' + itemLocation.toString());
    // print('OUT/itemLocation:' +itemLocation.location.toString());

    return itemLocation;
  }

  Locations returnDistrictIndexOf() {
    data.map((outter) {
      // print('start' + item.toString());
      // print('selectedCountryItemNotNull:' + selectedCountryItemNotNull.toString());
      // print('item.location:' +item.location.toString());
      // print('IN/itemLocation:' +itemLocation.location.toString());
      if (outter.location.toString().contains(selectedCountryItemNotNull.toString())) {
        // if(selectedCountryItemNotNull == ''){
        //   itemLocation = item;
          print('returnDistrictIndexOf (inner): /itemLocationCity: => ' +itemLocationCity.location.toString());
        //   return itemLocation;
        // }
        // print('asd');
        // print('item: ' + item.toString());
        // print('item.location.toString(): ' + item.location.toString());
        // print('selectedCountryItem.toString(): ' + selectedCountryItemNotNull.toString());
        outter.children?.map((inner) {
          if (inner.location.toString().contains(selectedCityItemNotNull.toString())) {
            print('selectedCityItemNotNull.toString(): ' + selectedCityItemNotNull.toString());
            itemLocationCity = inner;
            print('returnDistrictIndexOf (inner in): /itemLocationCity: => ' +itemLocationCity.location.toString());
          }
        }).toList();
        // itemLocation = outter;
        // print('IN/itemLocation:' +itemLocation.location.toString());
        // print('inner: ' + item.toString());
      }
      // return item;
    }).toList();
    // print('end: ' + itemLocation.toString());
    print('returnDistrictIndexOf (OUT)/itemLocationCity: => ' + itemLocationCity.location.toString());

    return itemLocation;
  }

/*  String ads() {
    String items = 'as';
    if(item.location.toString()==selectedCountryItem.toString()){
      // print(item.location);
      // selectedCountryItemIndex = item;
      return item;
    }
    data.map((item) {
      items = item.location.toString();
      print('inner: ' + item.location.toString());
      // return item.toString();
    }).toList();
    print('inner: ' + data.toString());

    return items;
  }

  int indexOfListItem(){
    data.map((item) =>
      if(item.location.toString() == 'Turkey'){
        selectedCountryItemIndex = data.indexOf(item);
        print('inner: '+selectedCountryItemIndex.toString());

      }

    ).toList();

    var map = data[0].children![0].sublocation!.asMap();
    print(map.keys.toList());
    // data.asMap()
    print('sdzf: $selectedCountryItemIndex');
    return selectedCountryItemIndex;
  }*/

  DropdownButton<String> buildCityDropdownButton() {
/*
    print('first: ${data[data.indexOf('element')].children![0].sublocation!.join(',')}');
    print('second: ${data[0].children}');
    print('third: ${data.indexOf(returnIndexOf())}');
    // print('outter returnIndexOf: '+returnIndexOf().toString());
    // print(''+data.toString());
    // print(data[indexOfListItem()]);
    // data.map((item) => item.location);

    print(data.where((item) =>
        item.location.toString().contains(selectedCountryItem!)).toList());
*/
    print('SelectCityItem: ' +
        selectedCityItem.toString() +
        '-/- disableCityDropDown: ' +
        disableCityDropDown.toString());

    return DropdownButton(
      value: selectedCityItem,
      // onChanged: disableCityDropDown[0] ? null : (e) => setState(() => selectedCityItem = e.toString(),),
      onChanged: (value) {
        if (disableCityDropDown[0] && selectedCountryItem == null) {
          null;
        } else {
          setState(() {
            disableCityDropDown[1] = false;
            selectedCityItem = value.toString();
            selectedCityItemNotNull = selectedCityItem!;
            selectedDistrictItem = null;
          });
        }
      },

      items: data[data.indexOf(returnCityIndexOf())]
          .children!
          .map(
            (item) => DropdownMenuItem<String>(
              // value: item.children![0].location.toString(),
              value: item.location.toString(),
              child: Text(
                item.location.toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ),
          )
          .toList(),
    );
  }

  DropdownButton<String> buildCountryDropdownButton() {
    // print('outter: '+ads());
    return DropdownButton(
      value: selectedCountryItem,

      onChanged: (value) {
        setState(() {
          selectedCityItem = null;
          selectedDistrictItem = null;
          selectedCountryItem = value.toString();
          // print('selectedCountryItem: '+selectedCountryItem!+'\nValue: '+value!);
          disableCityDropDown[0] = false;
          disableCityDropDown[1] = true;
          selectedCountryItemNotNull = selectedCountryItem!;
          // print('selectedCountryItemNotNull: ' + selectedCountryItemNotNull);
        });
      },
      // onChanged: (e) => setState(() => selectedCountryItem = e.toString()),
      items: data.map((item) {
        // selectedCountryItemIndex = data.indexOf(item);
        // print(selectedCountryItemIndex);
        return DropdownMenuItem<String>(
          value: item.location.toString(),
/*              onTap: () {
                selectedCountryItemList = item.location!;
              },*/

          child: Text(
            item.location!.join(", "),
            style: TextStyle(fontSize: 24),
          ),
        );
      }).toList(),
    );
  }

  LoginButton buildLoginButton() {
    return LoginButton(
      buttonText: 'Sign Up',
      onPressedFunction: validFunction,
    );
  }

  void validFunction() {
    final form = formKey.currentState!;

    if (form.validate()) {
      // final emails = emailController.text;
      form.save();

      print('Phone Number: ' +
          '${UserPreferences.myUser.phoneNumber}' +
          '\nDistrict: ' +
          '${UserPreferences.myUser.addressDistrict}' +
          '\nCity: ' +
          '${UserPreferences.myUser.addressCity}' +
          '\nCountry: ' +
          '${UserPreferences.myUser.addressCountry}' +
          '\nAddress: ' +
          '${UserPreferences.myUser.address}');

      Navigator.pushNamed(context, '/home');
      // print('${emailController.text}');
      /*ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('Your email is $email'),
        ));*/

    }
  }

  Column buildPhoneNoFormText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Phone No'),
        verticalSpaceTiny,
        Stack(
          children: [
            const TextFieldContainer(),
            TextFormField(
              style: fieldTextStyle,
              cursorColor: Colors.white,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              controller: phoneNumberController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
              onSaved: (newValue) {
                setState(
                  () {
                    // int phoneInt = int.parse(newValue!),
                    UserPreferences.myUser.phoneNumber = int.parse(newValue!);
                  },
                );
              },
              validator: (num) => num != null && num.length != 11 ? 'Enter 11 digit' : null,
              decoration: InputDecoration(
                // floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Enter your Phone Number',
                hintStyle: fieldTextStyle,
                border: InputBorder.none,
                // contentPadding: EdgeInsets.only(top: 10.0),
                prefixIcon: const Icon(
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}
