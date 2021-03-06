import 'package:capstone/models/categories.dart';
import 'package:capstone/utilities/constants.dart';
import 'package:capstone/utilities/snackbar.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/utilities/user_preferences.dart';
import 'package:capstone/widgets/text_field_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPostForm extends StatefulWidget {
  const SignUpPostForm({Key? key}) : super(key: key);

  @override
  _SignUpPostFormState createState() => _SignUpPostFormState();
}

class _SignUpPostFormState extends State<SignUpPostForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // FocusNode focusNodePhone = FocusNode();
  FocusNode focusNodeAddress = FocusNode();
  final phoneNumberController = TextEditingController();
  final addressBoxController = TextEditingController();
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

  List<bool> isDisableDropDown = [true, true];
  bool isValidate = false;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildPhoneNoFormText(context),
          // verticalSpaceMedium,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Location',
                style: labelStyle,
              ),
              verticalSpaceTiny,
              Row(
                children: [
                  buildCountryDropdownButton(),
                  horizontalSpaceSmall,
                  buildCityDropdownButton(),
                  horizontalSpaceSmall,
                  buildDistrictDropdownButton(),
                ],
              ),
            ],
          ),
          // verticalSpaceRegular,
          verticalSpaceSmall,
          buildAddressFormText(context),
          verticalSpaceMedium,
          buildLoginButton(),
          // DropdownButton(items: items, onChanged: onChanged)
        ],
      ),
    );
  }

  Column buildAddressFormText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Address',
          style: labelStyle,
        ),
        verticalSpaceTiny,
        Container(
          decoration: boxDecorationStyle.copyWith(
            shape: BoxShape.rectangle,
            color: const Color(0xBE385C89),
          ),
          // padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            // scrollPadding: const EdgeInsets.only(top: 50),
            focusNode: focusNodeAddress,
            style: fieldTextStyle,
            cursorColor: Colors.white,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            controller: addressBoxController,
            maxLines: 3,
            textAlign: TextAlign.center,
            // minLines: null,
            // minLines: 2,
            // maxLines: 5,
            maxLength: 200,

            // onEditingComplete: ,
            //   r"^[a-z ,.'-]+$"
/*
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-.,/ ]+( [a-zA-Z0-9_]+)*')),
                ],
*/

            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),

            onSaved: (address) {
              setState(
                () {
                  // int phoneInt = int.parse(newValue!),
                  UserPreferences.newUser.address = address;
                },
              );
            },

            validator: (text) =>
                text != null && text.isEmpty ? 'enter your address' : null,

            decoration: InputDecoration(
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: 'Enter your Address here',
              hintStyle: hintTextStyle,

              /*hintStyle: const TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),*/
              contentPadding: const EdgeInsets.only(top: 42.5),

              border: InputBorder.none,
              /*border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.amber,
                          style: BorderStyle.solid,
                          width: 3,
                      ),
                  ),*/
              // contentPadding: EdgeInsets.only(top: 10.0),
              prefixIcon: const Icon(
                Icons.home,
                color: Colors.white,
              ),

              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white54,
                ),
                onPressed: () => addressBoxController.clear(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container buildDistrictDropdownButton() {
    return Container(
      decoration: boxDecorationStyle,
      alignment: Alignment.centerLeft,
      width: screenWidthPercentage(context, percentage: 0.25),
      padding: const EdgeInsets.only(left: 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
/*            disabledHint: Text('asfasfasgsadghsh'),
            focusColor: Colors.amber,
            disabledHint: Text('district'),
            underline: const SizedBox(),
            decoration: InputDecoration(
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.location_city)
                // hintText: 'adfg'
              ),
            borderRadius: BorderRadius.circular(10),
            menuMaxHeight: 150,
            dropdownColor: const Color(0xFFFFFFFF),*/

            itemHeight: 50,
            alignment: Alignment.centerLeft,
            elevation: 0,
            isExpanded: true,
            style: fieldTextStyle,
            decoration: buildInputDecoration(),
            dropdownColor: const Color(0xCD000000),
            hint: buildHintText('District'),

/*
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_city),
                // alignLabelWithHint: true,
                constraints: BoxConstraints(

                  maxWidth: screenWidthPercentage(context, percentage: 0.55),
                  minWidth: screenWidthPercentage(context, percentage: 0.35),
                )

              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(25) ),
              // borderSide: BorderSide(width: 30,color: Colors.amber,style: BorderStyle.solid )
              // )
            ),
            // iconSize: 25,
            icon: const Icon(
              Icons.location_city,
              color: Colors.white,
              size: 20,
            ),
*/

            // onChanged: disableCityDropDown[1] ? null : (e) => setState(() => selectedDistrictItem = e.toString()),

            onSaved: (district) {
              setState(
                () {
                  // int phoneInt = int.parse(newValue!),
                  print('District: ' + district.toString());
                  // UserPreferences.myUser.addressCountry = newValue.toString();
                  UserPreferences.newUser.addressDistrict = district.toString();
                },
              );
            },
            onChanged: (value) {
              if (isDisableDropDown[1] && selectedCityItem == null) {
                null;
              } else {
                setState(() {
                  selectedDistrictItem = value.toString();
                  selectedDistrictItemNotNull = selectedDistrictItem!;
                });
              }
            },
            validator: (location) =>
                location != null && isDisableDropDown[1] == true ||
                        selectedDistrictItemNotNull != selectedDistrictItem
                    ? 'select a location'
                    : null,

/*
            validator: (value) {
              if(isDisableDropDown.contains(true)){
                'select a location';
              }
              else
                null;
            },
*/

            // autovalidateMode: AutovalidateMode.always,

            value: selectedDistrictItem,
            items: returnDistrictIndexOf().sublocation?.map((item) {
              return DropdownMenuItem<String>(
                alignment: Alignment.centerLeft,
                value: item.toString(),
                child: Text(
                  item.toString(),
                ),
              );
            }).toList()

/*          items: data[data.indexOf(returnCityIndexOf())]
              .sublocation!
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item.toString(),
                  child: Text(
                    item.toString(),
                  ),
                ),
              )
              .toList(),*/

            ),
      ),
    );
  }

  Container buildCityDropdownButton() {
/*    print('first: ${data[data.indexOf('element')].children![0].sublocation!.join(',')}');
    print('second: ${data[0].children}');
    print('third: ${data.indexOf(returnIndexOf())}');
    // print('outter returnIndexOf: '+returnIndexOf().toString());
    // print(''+data.toString());
    // print(data[indexOfListItem()]);
    // data.map((item) => item.location);

    print(data.where((item) =>
        item.location.toString().contains(selectedCountryItem!)).toList());
    print('SelectCityItem: ' +
        selectedCityItem.toString() +
        '-/- disableCityDropDown: ' +
        disableCityDropDown.toString());*/

    return Container(
      decoration: boxDecorationStyle,
      alignment: Alignment.centerLeft,
      width: screenWidthPercentage(context, percentage: 0.25),
      padding: const EdgeInsets.only(left: 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          // borderRadius: BorderRadius.circular(10),
          // menuMaxHeight: 150,
          // dropdownColor: const Color(0xFFFFFFFF),

          isExpanded: true,
          itemHeight: 50,
          alignment: Alignment.centerLeft,
          elevation: 0,
          decoration: buildInputDecoration(),
          style: fieldTextStyle,
          dropdownColor: const Color(0xCD000000),
          hint: buildHintText('City'),

/*
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.location_city),
              // alignLabelWithHint: true,
              constraints: BoxConstraints(

                maxWidth: screenWidthPercentage(context, percentage: 0.55),
                minWidth: screenWidthPercentage(context, percentage: 0.35),
              )

            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(25) ),
            // borderSide: BorderSide(width: 30,color: Colors.amber,style: BorderStyle.solid )
            // )
          ),


          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontFamily: 'RobotoSlab',
          ),

          iconSize: 25,
          icon: const Icon(
            Icons.location_city,
            color: Colors.white,
            size: 20,
          ),
          hint: Text(
            'City',
            style: hintTextStyle.copyWith(
              color: Colors.white54,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
*/

          onSaved: (city) {
            setState(
              () {
                // int phoneInt = int.parse(newValue!),
                print('City: ' + city.toString());
                // UserPreferences.myUser.addressCountry = newValue.toString();
                UserPreferences.newUser.addressCity = city.toString();
              },
            );
          },

          validator: (value) {
            if (value != null && isDisableDropDown[1] == true ||
                selectedCityItem != selectedCityItemNotNull) {
              return 'select your city';
            } else {
              null;
            }
          },

          // onChanged: disableCityDropDown[0] ? null : (e) => setState(() => selectedCityItem = e.toString(),),
          onChanged: (value) {
            if (isDisableDropDown[0] && selectedCountryItem == null) {
              null;
            } else {
              setState(() {
                isDisableDropDown[1] = false;
                selectedCityItem = value.toString();
                // print(selectedCityItem);
                selectedCityItemNotNull = selectedCityItem!;
                selectedDistrictItem = null;
              });
            }
          },
/*      items: data[data.indexOf(returnCityIndexOf())]
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
              .toList(),*/
          value: selectedCityItem,

          items: returnCityIndexOf().children!.map((item) {
            return DropdownMenuItem<String>(
              alignment: Alignment.centerLeft,
              // value: item.children![0].location.toString(),
              value: item.location?.join(),
              child: Text(
                item.location!.join(','),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Container buildCountryDropdownButton() {
    // print('outter: '+ads());
    return Container(
      decoration: boxDecorationStyle,
      alignment: Alignment.centerLeft,
      width: screenWidthPercentage(context, percentage: 0.25),
      padding: const EdgeInsets.only(left: 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          isExpanded: true,
          // borderRadius: BorderRadius.circular(10),
          // menuMaxHeight: 150,
          itemHeight: 50,
          alignment: Alignment.centerLeft,
          elevation: 0,
          dropdownColor: const Color(0xCD000000),
          hint: buildHintText('Country'),
          decoration: buildInputDecoration(),
          style: fieldTextStyle,

/*          // iconSize: 25,
          icon: const Icon(
            Icons.location_city,
            color: Colors.white,
            size: 20,
          ),

          hint: Text(
            'Country',
            style: hintTextStyle.copyWith(
              color: Colors.white54,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),*/

          value: selectedCountryItem,

          onChanged: (value) {
            setState(() {
              nullAssign();
              // itemLocation = Locations();
              selectedCountryItem = value.toString();
              selectedCountryItemNotNull = selectedCountryItem!;
              print('selectedCountryItem: ' +
                  selectedCountryItem.toString() +
                  ' |Value: ' +
                  value.toString());
              // print('selectedCountryItemNotNull: ' + selectedCountryItemNotNull);
            });
          },

          onSaved: (country) {
            setState(
              () {
                // int phoneInt = int.parse(newValue!),
                print('Country: ' + country.toString());
                // UserPreferences.myUser.addressCountry = newValue.toString();
                UserPreferences.newUser.addressCountry = country.toString();
              },
            );
          },

          validator: (value) {
            if (value != null && isDisableDropDown[0] == true ||
                selectedCountryItem != selectedCountryItemNotNull) {
              return 'select your country';
            } else {
              null;
            }
          },

          // onChanged: (e) => setState(() => selectedCountryItem = e.toString()),
          items: data.map((item) {
            // selectedCountryItemIndex = data.indexOf(item);
            // print(selectedCountryItemIndex);
            return DropdownMenuItem<String>(
              alignment: Alignment.centerLeft,
              value: item.location?.join(),
/*              onTap: () {
                    selectedCountryItemList = item.location!;
                  },*/
              child: Text(
                item.location!.join(", "),
                // style: const TextStyle(fontSize: 24),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Text buildHintText(String hintText) {
    return Text(
      hintText,
      style: hintTextStyle,
    );
  }

/*  TextStyle buildTextStyle() {
    return const TextStyle(
      fontSize: 16,
      color: Colors.white,
      // fontWeight: FontWeight.w400,
    );
  }*/

  InputDecoration buildInputDecoration() {
    return InputDecoration(
        // prefixIcon: const Icon(Icons.location_city, color: Colors.white),
        constraints: BoxConstraints(
      maxWidth: screenWidthPercentage(context, percentage: 0.6),
      minWidth: screenWidthPercentage(context, percentage: 0.3),
    )

        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(25) ),
        // borderSide: BorderSide(width: 30,color: Colors.amber,style: BorderStyle.solid )
        // )
        );
  }

  void nullAssign() {
    selectedCityItem = null;
    selectedDistrictItem = null;
    isDisableDropDown[0] = false;
    isDisableDropDown[1] = true;
    itemLocationCity = Locations();
  }

  Locations returnCityIndexOf() {
    data.map((item) {
      // print('start' + item.toString());
      // print('selectedCountryItemNotNull:' + selectedCountryItemNotNull.toString());
      // print('item.location:' +item.location.toString());
      // print('IN/itemLocation:' +itemLocation.location.toString());
      if (item.location
              .toString()
              .contains(selectedCountryItemNotNull.toString()) &&
          selectedCountryItem != null) {
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
      // print('selectedCityItem.toString(): ' + selectedCityItem.toString());
      if (outter.location
              .toString()
              .contains(selectedCountryItemNotNull.toString()) &&
          selectedCityItem != null) {
        // if(selectedCountryItemNotNull == ''){
        //   itemLocation = item;
        //   print('returnDistrictIndexOf (inner): /itemLocationCity: => ' +itemLocationCity.location.toString());
        //   print('selectedCityItemNotNull.toString(): ' + selectedCityItemNotNull.toString());
//   return itemLocation;
        // }
        // print('asd');
        // print('item: ' + item.toString());
        // print('item.location.toString(): ' + item.location.toString());
        // print('selectedCountryItem.toString(): ' + selectedCountryItemNotNull.toString());
        outter.children?.map((inner) {
          if (inner.location
                  .toString()
                  .contains(selectedCityItemNotNull.toString()) &&
              selectedCityItem != null) {
            // print('selectedCityItemNotNull.toString(): ' + selectedCityItemNotNull.toString());
            itemLocationCity = inner;
            // print('returnDistrictIndexOf (inner in): /itemLocationCity: => ' +itemLocationCity.location.toString());
          }
        }).toList();
        // itemLocation = outter;
        // print('IN/itemLocation:' +itemLocation.location.toString());
        // print('inner: ' + item.toString());
      }
      // return item;
    }).toList();
    // print('end: ' + itemLocation.toString());
    // print('returnDistrictIndexOf (OUT)/itemLocationCity: => ' + itemLocationCity.location.toString());
    // print('returnDistrictIndexOf (OUT)/itemLocation: => ' + itemLocation.location.toString());

    return itemLocationCity;
  }

/*  LoginButton buildLoginButton() {
    return LoginButton(
      buttonText: 'Sign Up',
      onPressedFunction: validFunction,
    );
  }*/

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
            // validFunction();
/*            if(await buildDialog() == true){
              print('goes to registered');
              _registerWithEmailNPassword();
            }*/
            buildDialog().then((_) {
              if(isValidate == true){
                print('goes to registered');
                _registerWithEmailNPassword();
              }
            });
          // _registerWithEmailNPassword();
            print('out to registered: ${isValidate.toString()}');
          }
        },
        // onPressed: () => print('Login Button Pressed'),
        child: const Text(
          'Sign Up',
          style: buttonTextStyle,
        ),
      ),
    );
  }

/*  void validFunction() async {
    final form = formKey.currentState!;

    if (form.validate()) {
      await buildDialog();
      // final emails = emailController.text;
      form.save();
      _registerWithEmailNPassword();

      print('Phone Number: ' +
          '${UserPreferences.newUser.phoneNumber}' +
          '\nDistrict: ' +
          '${UserPreferences.newUser.addressDistrict}' +
          '\nCity: ' +
          '${UserPreferences.newUser.addressCity}' +
          '\nCountry: ' +
          '${UserPreferences.newUser.addressCountry}' +
          '\nAddress: ' +
          '${UserPreferences.newUser.address}');

      Navigator.pushNamed(context, '/home');
      // print('${emailController.text}');
      *//*ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('Your email is $email'),
        ));*//*

    }
  }*/

  buildDialog() async {
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

  void _registerWithEmailNPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: UserPreferences.newUser.email!,
        password: UserPreferences.newUser.password!,
      );
      final User user = userCredential.user!;
/*      FirebaseFirestore.instance.collection('users').doc().set({
        'uid': user.uid,
        'first name': UserPreferences.newUser.firstName,
        'last name': UserPreferences.newUser.lastName,
        'email': user.email,
        'password': UserPreferences.newUser.password,
        'phone number': UserPreferences.newUser.phoneNumber,
        'about': UserPreferences.newUser.about,
        'address': UserPreferences.newUser.address,
        'district': UserPreferences.newUser.addressDistrict,
        'city': UserPreferences.newUser.addressCity,
        'country': UserPreferences.newUser.addressCountry,
        // 'isEmailVerified': user.emailVerified, // will also be false
        'photoUrl': UserPreferences.newUser.imagePath, // will always be null
      });*/

      if (user != null) {
        setState(() {
          SnackBarMessage.showSnackBar(context,
              text: 'Register accomplished\n\n'
                  // '${user.uid}\t'
                  '${UserPreferences.newUser.firstName} '
                  '${UserPreferences.newUser.lastName}');
        });
          Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          SnackBarMessage.showSnackBar(context,
              text: 'r-register, it seems failed..');
        });
      }
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        SnackBarMessage.showSnackBar(context,
            text: 'ouch!! register is failed!\n\n${e.toString()}');
      });
    }
  }

  Column buildPhoneNoFormText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Phone No',
          style: labelStyle,
        ),
        verticalSpaceTiny,
        Stack(
          children: [
            const TextFieldContainer(),
            TextFormField(
              // focusNode: focusNodePhone,
              style: fieldTextStyle,
              cursorColor: Colors.white,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              controller: phoneNumberController,
              maxLength: 11,

              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],

              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(focusNodeAddress),

              onSaved: (newValue) {
                setState(
                  () {
                    // int phoneInt = int.parse(newValue!),
                    UserPreferences.newUser.phoneNumber = int.parse(newValue!);
                  },
                );
              },
              validator: (val) =>
                  val != null && val.length != 11 ? 'Enter 11 digit' : null,
              decoration: InputDecoration(
                // floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Enter your Phone Number',
                hintStyle: hintTextStyle,
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
/*          Row(
            children: [
              Container(
                decoration: boxDecorationStyle.copyWith(
                  shape: BoxShape.rectangle,
                  color: const Color(0xBE385C89),
                ),
                alignment: Alignment.centerLeft,
                width: screenWidthPercentage(context, percentage: 0.25),
                height: screenHeightPercentage(context,percentage: 0.06),
                padding: const EdgeInsets.only(left: 30),
                child: TextFormField(
                  style: fieldTextStyle,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  maxLength: 2,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.bottom,

                  //   r"^[a-z ,.'-]+$"
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],

                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

                  onSaved: (day) {
                    setState(
                          () {
                        // int phoneInt = int.parse(newValue!),
                        UserPreferences.myUser.day = int.parse(day!);
                      },
                    );
                  },

                  validator: (day) => day?.length == 2 && int.parse(day!) < 31 ? null :'enter your address',

                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 20),
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'age',
                    hintStyle: hintTextStyle,

                    /*hintStyle: const TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),*/

                    // border: InputBorder.none,
                    border: OutlineInputBorder(borderSide: BorderSide(width: 3)),
                    // contentPadding: EdgeInsets.only(top: 10.0),
/*                    prefixIcon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),

                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white54,
                      ),
                      onPressed: () => addressBoxController.clear(),
                    ),*/
                  ),
                ),
              ),
              horizontalSpaceSmall,

/*              Container(
                decoration: boxDecorationStyle.copyWith(
                  shape: BoxShape.rectangle,
                  color: const Color(0xBE385C89),
                ),
                alignment: Alignment.centerLeft,
                width: screenWidthPercentage(context, percentage: 0.25),
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  focusNode: focusNodeAddress,
                  style: fieldTextStyle,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  controller: addressBoxController,
                  maxLines: 3,
                  // minLines: null,
                  // minLines: 1,
                  // maxLines: 5,
                  maxLength: 200,

                  // onEditingComplete: ,
                  //   r"^[a-z ,.'-]+$"
*//*
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-.,/ ]+( [a-zA-Z0-9_]+)*')),
            ],
*//*

                  onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),

                  onSaved: (address) {
                    setState(
                          () {
                        // int phoneInt = int.parse(newValue!),
                        UserPreferences.myUser.address = address;
                      },
                    );
                  },

                  validator: (text) => text != null && text.isEmpty ? 'enter your address' : null,

                  decoration: InputDecoration(
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Enter your Address here',
                    hintStyle: hintTextStyle,

                    *//*hintStyle: const TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),*//*

                    border: InputBorder.none,
                    // contentPadding: EdgeInsets.only(top: 10.0),
                    prefixIcon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),

                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white54,
                      ),
                      onPressed: () => addressBoxController.clear(),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: boxDecorationStyle.copyWith(
                  shape: BoxShape.rectangle,
                  color: const Color(0xBE385C89),
                ),
                alignment: Alignment.centerLeft,
                width: screenWidthPercentage(context, percentage: 0.25),
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  style: fieldTextStyle,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  controller: addressBoxController,
                  maxLines: 3,
                  // minLines: null,
                  // minLines: 1,
                  // maxLines: 5,
                  maxLength: 200,

                  // onEditingComplete: ,
                  //   r"^[a-z ,.'-]+$"
*//*
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-.,/ ]+( [a-zA-Z0-9_]+)*')),
            ],
*//*

                  onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),

                  onSaved: (address) {
                    setState(
                          () {
                        // int phoneInt = int.parse(newValue!),
                        UserPreferences.myUser.address = address;
                      },
                    );
                  },

                  validator: (text) => text != null && text.isEmpty ? 'enter your address' : null,

                  decoration: InputDecoration(
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Enter your Address here',
                    hintStyle: hintTextStyle,

                    *//*hintStyle: const TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),*//*

                    border: InputBorder.none,
                    // contentPadding: EdgeInsets.only(top: 10.0),
                    prefixIcon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),

                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white54,
                      ),
                      onPressed: () => addressBoxController.clear(),
                    ),
                  ),
                ),
              ),*/
              Container(
                decoration: boxDecorationStyle.copyWith(
                  shape: BoxShape.rectangle,
                  color: const Color(0xBE385C89),
                ),
                alignment: Alignment.centerLeft,
                width: screenWidthPercentage(context, percentage: 0.25),
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  style: fieldTextStyle,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  maxLength: 2,

                  //   r"^[a-z ,.'-]+$"
/*
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-.,/ ]+( [a-zA-Z0-9_]+)*')),
            ],
*/

                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

                  onSaved: (day) {
                    setState(
                          () {
                        // int phoneInt = int.parse(newValue!),
                        UserPreferences.myUser.day = int.parse(day!);
                      },
                    );
                  },

                  validator: (day) => day?.length == 2 ? null :'enter your address',

                  decoration: const InputDecoration(
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Enter your Address here',
                    hintStyle: hintTextStyle,

                    /*hintStyle: const TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),*/

                    border: InputBorder.none,
                    // contentPadding: EdgeInsets.only(top: 10.0),
/*                    prefixIcon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),

                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white54,
                      ),
                      onPressed: () => addressBoxController.clear(),
                    ),*/
                  ),
                ),
              ),
              horizontalSpaceSmall,
              Container(
                decoration: boxDecorationStyle.copyWith(
                  shape: BoxShape.rectangle,
                  color: const Color(0xBE385C89),
                ),
                alignment: Alignment.centerLeft,
                width: screenWidthPercentage(context, percentage: 0.25),
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  style: fieldTextStyle,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  maxLength: 2,

                  //   r"^[a-z ,.'-]+$"
/*
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-.,/ ]+( [a-zA-Z0-9_]+)*')),
            ],
*/

                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

                  onSaved: (day) {
                    setState(
                          () {
                        // int phoneInt = int.parse(newValue!),
                        UserPreferences.myUser.day = int.parse(day!);
                      },
                    );
                  },

                  validator: (day) => day?.length == 2 ? null :'enter your address',

                  decoration: const InputDecoration(
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Enter your Address here',
                    hintStyle: hintTextStyle,

                    /*hintStyle: const TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),*/

                    border: InputBorder.none,
                    // contentPadding: EdgeInsets.only(top: 10.0),
/*                    prefixIcon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),

                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white54,
                      ),
                      onPressed: () => addressBoxController.clear(),
                    ),*/
                  ),
                ),
              ),
            ],
          ),*/
