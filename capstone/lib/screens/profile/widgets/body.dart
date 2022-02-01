import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/utilities/user_preferences.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Container(
          // margin: EdgeInsets.all(15),
          // padding: EdgeInsets.all(25),
          height: screenHeightPercentage(context,percentage: 0.8),
          width: screenWidthPercentage(context,percentage: 0.99),
/*            decoration: BoxDecoration(
            // color: Color(0xffbebebe),
            color: Color(0xffffffff),

          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
/*            padding: const EdgeInsets.only(top: 10,left: 25),
          // margin: EdgeInsets.only(bottom: 100),
          height: 200,
          width: double.infinity,*/
                // color: Colors.deepOrange[200],
                alignment: Alignment.bottomLeft,
                width: screenWidthPercentage(context, percentage: 0.9),
                height: screenHeightPercentage(context, percentage: 0.175),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InkWell(
                      // onTap: ()=> Navigator.pushNamed(context,'/profile'),
                      child: CircleAvatar(
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
                        radius: 55,
                        // backgroundColor: Color(0xFF778899),
                        backgroundImage:
                        NetworkImage('https://pbs.twimg.com/media/FHfttxDWQAAJQNK?format=jpg&name=large')
                        // NetworkImage('https://pbs.twimg.com/media/FIP5cJrWYAEyhAy?format=jpg&name=large'),
                      ),
                    ),
                    Text(
                      '${UserPreferences.myUser.firstName} ${UserPreferences.myUser.lastName}',
                      style: const TextStyle(color: Colors.black,fontSize: 24,),
                    )
                  ],
                ),
              ),
              buildDivider(context),
              // const NavigationDrawer(),
            ],
          ),
          // color: Colors.indigo[200],
        ),
      ),
    );
  }

  Divider buildDivider(BuildContext context) {
    return Divider(
                height: screenHeightPercentage(context,percentage: 0.025),
                color: const Color(0xFF0E2B4E),
                thickness: 1,
                indent: screenWidthPercentage(context,percentage: 0.1),
                endIndent: screenWidthPercentage(context,percentage: 0.1),
              );
  }
}
