import 'package:capstone/screens/profile/widgets/Body.dart';
import 'package:capstone/utilities/constants.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/utilities/user_preferences.dart';
import 'package:flutter/material.dart';

class ProfileScreenNew extends StatelessWidget {
  const ProfileScreenNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _enabled = false;

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // collapsedHeight: 100,
              // backgroundColor: Colors.amberAccent,
              floating: true,
              elevation: 3,
              pinned: true,
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
/*            centerTitle: true,
              title: const Text(
                'User Setting',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'OpenSans',
                ),
              ),*/
              expandedHeight: screenHeightPercentage(context, percentage: 0.3),

              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.all(15),
                collapseMode: CollapseMode.parallax,
                background: Image.network(
                  UserPreferences.myUser.imagePath,
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
                title: Text(
                  '${UserPreferences.myUser.firstName}' '${UserPreferences.myUser.lastName}',
                  style: appBarTitleStyle.copyWith(
                    color: Colors.white,
                    letterSpacing: -1.5,
                    wordSpacing: 2.5,
                  ),
                ),
              ),

              actions: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(right: screenWidthPercentage(context, percentage: 0.0375)),
                  tooltip: 'edit',
                  color: Colors.white,
                  // iconSize: screenWidthPercentage(context, percentage: 0.1),
                  // onPressed: () => Navigator.pop(context),
                  onPressed: () => Navigator.pushNamed(context, '/'),
                  icon: const Icon(
                    Icons.edit_outlined,
                    size: 30,
                  ),
                ),
              ],
            ),
            const Body(),
            /*SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => profileLabels[index],
                childCount: profileLabels.length,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

/*
getRandomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)],
}*/
