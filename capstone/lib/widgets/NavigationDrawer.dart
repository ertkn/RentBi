import 'package:capstone/utilities/utility_constants.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        // backgroundColor: Colors.deepOrangeAccent[200],
        elevation: 0,
        child: Container(
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
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                // margin: EdgeInsets.only(bottom: 100),
                height: 250,
                alignment: Alignment.topCenter,
                width: double.infinity,
                color: Colors.deepOrange[200],
                child: InkWell(
                  onTap: ()=> Navigator.pushNamed(context,'/profile'),
                  child: const CircleAvatar(
/*                  radius: 90.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      'https://pbs.twimg.com/media/FJFssbhWQAAB32g?format=jpg&name=large',
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      height: double.maxFinite,
                    ),
                  ),*/
                    radius: 85,
                    backgroundColor: Color(0xFF778899),
                    backgroundImage:
                    NetworkImage('https://pbs.twimg.com/media/FIP5cJrWYAEyhAy?format=jpg&name=large'),
                  ),
                ),
              ),
              menuBuilder(
                title: 'Profile',
                iconData: Icons.person_outline,
              ),
              menuBuilder(
                title: 'Shopping Cart',
                iconData: Icons.shopping_cart_outlined,
              ),
              menuBuilder(
                title: 'Settings',
                iconData: Icons.settings,
              ),
              menuBuilder(
                title: 'Log out',
                iconData: Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuBuilder({required String title, required IconData iconData}) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.white,
        size: 32,
      ),
      title: Text(
        title,
        style: hintTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      onTap: () {},
    );
  }
}
