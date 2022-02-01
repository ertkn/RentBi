import 'package:capstone/utilities/spacing.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.deepPurpleAccent,
      height: screenHeightPercentage(context, percentage: 0.5),
      width: screenWidthPercentage(context),
      child: ListView(
        children: <Widget>[
          TextFormField(

          ),
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
          menuBuilder(
            title: 'Shopping Cart',
            iconData: Icons.shopping_cart_outlined,
            navPath: () => Navigator.pushNamed(context, '/cart'),
          ),
          menuBuilder(
            title: 'Settings',
            iconData: Icons.settings,
            navPath: () => Navigator.pushNamed(context, '/settings'),
          ),
          menuBuilder(
            title: 'Log out',
            iconData: Icons.logout,
            navPath: () => Navigator.pushNamed(context, '/'),
          ),
        ],
      ),
    );
  }

  Widget menuBuilder({required String title, required IconData iconData, required Function() navPath}) {
    return ListTile(
      // tileColor: Colors.deepOrange,
      leading: Icon(
        iconData,
        color: Colors.black,
        size: 32,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xBF000000),
          fontSize: 26,
          letterSpacing: 1.5,
          // fontWeight: FontWeight.w600,
        ),
      ),
      onTap: navPath,
      // minLeadingWidth: 45,
      // minVerticalPadding: 5,
      // horizontalTitleGap: 27.5,
      contentPadding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
    );
  }
}
/*        width: screenWidthPercentage(context,percentage: 1),
        decoration: backgroundDecorationStyle,*/
