import 'package:capstone/utilities/constants.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/utilities/user_preferences.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class ProfileNew extends StatelessWidget {
  const ProfileNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // collapsedHeight: 150,
            floating: true,
            elevation: 3,
            pinned: false,
            leading: IconButton(
              padding: EdgeInsets.only(left: screenWidthPercentage(context, percentage: 0.075)),
              alignment: Alignment.center,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                // color: Color(0xBE385C89),
              ),
              // constraints: const BoxConstraints(minHeight: 100.0, minWidth: 0.0),
              tooltip: 'go back',
              onPressed: () => Navigator.pop(context),
            ),
            // centerTitle: true,
            /*title: const Text(
              'User Setting',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: 'OpenSans',
              ),
            ),*/
            expandedHeight: screenHeightPercentage(context, percentage: 0.25),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                UserPreferences.myUser.imagePath,
                fit: BoxFit.fill,
              ),
              centerTitle: true,
              title: Text(
                'User Settings',
                style: appBarTitleStyle.copyWith(color: Colors.white),
              ),
            ),

            actions: <Widget>[
              IconButton(
                padding: EdgeInsets.only(right: screenWidthPercentage(context, percentage: 0.0375)),
                tooltip: 'quit',
                color: Colors.white,
                // iconSize: screenWidthPercentage(context, percentage: 0.1),
                // onPressed: () => Navigator.pop(context),
                onPressed: () => Navigator.pushNamed(context, '/'),
                icon: const Icon(
                  Icons.logout,
                  size: 30,
                ),
              ),
            ],
          ),

/*          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, index) {
              return Container(
                padding: EdgeInsets.only(left:25),
                height: 50,
                alignment: Alignment.centerLeft,
                // color: Colors.deepPurple[100 * (index % 9)],
                color: Colors.white,
                child: Column(
                  children: */ /*[
                    Text('orange $index',style: TextStyle(
                      color: Colors.deepPurple[100 * (index % 9)],
                      letterSpacing: -0.75,
                      fontSize: 20,
                    ),),
                  ],*/ /*
                  <Widget>[
                    menuBuilder(
                        title: 'Profile',
                        iconData: Icons.person_outline,
                        navPath: () => Navigator.pushNamed(context, '/profile')),
                  ]
                ),
              );
            }, childCount: 5),
          ),*/
          SliverFixedExtentList(
            itemExtent: screenHeightPercentage(context, percentage: 0.1),
            delegate: SliverChildListDelegate(
              [
                menuBuilder(
                  title: 'Profile',
                  iconData: Icons.person_outline,
                  navPath: () => Navigator.pushNamed(context, '/profile'),
                ),
                menuBuilder(
                  title: 'Favourites',
                  iconData: Icons.favorite_border,
                  navPath: () => Navigator.pushNamed(context, '/cart'),
                ),
                // buildDivider(context),
                menuBuilder(
                  title: 'Shopping Cart',
                  iconData: Icons.shopping_cart_outlined,
                  navPath: () => Navigator.pushNamed(context, '/cart'),
                ),
                // buildDivider(context),
                menuBuilder(
                  title: 'Settings',
                  iconData: Icons.settings,
                  navPath: () => Navigator.pushNamed(context, '/settings'),
                ),
                // buildDivider(context),
                menuBuilder(
                  title: 'Log out',
                  iconData: Icons.logout,
                  navPath: () => Navigator.pushNamed(context, '/'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menuBuilder({required String title, required IconData iconData, required Function() navPath}) {
/*      leading: Icon(
        iconData,
        color: Colors.black,
        size: 32,
      ),

      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xBF000000),
          fontSize: 26,
          letterSpacing: -1.5,
          // fontWeight: FontWeight.w600,
        ),
      ),

      // minLeadingWidth: 45,
      // minVerticalPadding: 5,
      // horizontalTitleGap: 27.5,
      contentPadding: const EdgeInsets.all(20),*/

    return TextFormField(
      onTap: navPath,readOnly: true,

      style: fieldTextStyle,
      // cursorColor: Colors.white,
      // keyboardType: TextInputType.name,

      // textInputAction: TextInputAction.next,
      // onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

      // controller: firstNameController,
      //
      // validator: (value) => value != null && (value.length > 50 || value.isEmpty)
      //     ? 'Name length must be between 1-50 characters'
      //     : null,

      // onSaved: (newValue) {
      //   setState(() {
      //     UserPreferences.myUser.firstName = newValue;
      //   });
      // },
      enabled: true,

      decoration: InputDecoration(

        labelText: title,
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 30, style: BorderStyle.solid)),
        contentPadding: EdgeInsets.only(top: 10.0),
        prefixIcon: Icon(
          iconData,
          color: Colors.black,
          size: 30,
        ),
        // hintText: 'Enter your First Name',
        // hintStyle: hintTextStyle,
      ),
    );
/*  return SimpleSettingsTile(
    title: title,
    enabled: true,
    leading: Icon(iconData,size: 24,color: Colors.black,),
    onTap: navPath,
  );*/
  }

  Divider buildDivider(BuildContext context) {
    return Divider(
      height: screenHeightPercentage(context, percentage: 0.025),
      // color: const Color(0xFF0E2B4E),
      color: Colors.black,
      thickness: 1,
      // indent: screenWidthPercentage(context,percentage: 0.1),
      // endIndent: screenWidthPercentage(context,percentage: 0.1),
    );
  }
}
