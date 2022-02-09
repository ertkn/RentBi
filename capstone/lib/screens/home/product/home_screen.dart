import 'package:capstone/screens/home/product/widgets/searchBar.dart';
import 'package:capstone/screens/home/product//widgets/body.dart';
import 'package:capstone/utilities/spacing.dart';
import 'package:capstone/utilities/user_preferences.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // toolbarHeight: 65,
      foregroundColor: Colors.black,
      backgroundColor: const Color(0xFFC186B0),
      primary: true,
      elevation: 0,
      // centerTitle: true,
      titleSpacing: screenWidthPercentage(context, percentage: 0.02),

      // backgroundColor: const Color(0xFFB6CFEC),
      leading: IconButton(
        padding: EdgeInsets.only(left: screenWidthPercentage(context, percentage: 0.025)),
        alignment: Alignment.center,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black38,
          // color: Color(0xBE385C89),
        ),
        // constraints: const BoxConstraints(minHeight: 100.0, minWidth: 0.0),
        tooltip: 'go back',
        onPressed: () => Navigator.pop(context),
      ),

      /*title: SizedBox(
        // color: Colors.indigoAccent,
        height: screenHeightPercentage(context, percentage: 0.045),
        width: screenWidthPercentage(context, percentage: 0.65),
        // margin: const EdgeInsets.fromLTRB(0, 19.25, 0, 0),
        // decoration: kBoxDecorationStyle,
        // padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: TextFormField(
          controller: controller,
          cursorColor: Colors.black12,
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.center,
          // controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            // fillColor: Colors.indigoAccent,
            // filled: true,
            // isDense: true,
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7.5))),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular((7.5))),
              borderSide: BorderSide(color: Colors.black45, width: 1),
            ),
            // border:UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
            // disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 10, color: Colors.transparent)),
            constraints: const BoxConstraints(
              minHeight: 0,
              minWidth: 0,
            ),

            prefixIcon: IconButton(
              icon: const Icon(
                Icons.search,
              ),
              color: Colors.black45,
              onPressed: () => print('searched'),
              tooltip: 'search',
            ),
            suffixIcon: IconButton(
              onPressed: () => print('closed'),
              // onPressed: () => controller.clear(),
              icon: const Icon(Icons.close),
              tooltip: 'delete',
              color: Colors.black26,
            ),
            // hintText: 'Marka, ürün, üye, #etiket ara',
            hintText: 'RentBi\'de Ara',
            hintStyle: const TextStyle(
              fontFamily: 'OpenSans',
            ),
            // isCollapsed: false,
            // border: OutlineInputBorder(),
          ),
        ),
      ),*/
      title: const SearchBar(),

      actions: [
        IconButton(
          padding: EdgeInsets.only(right: screenWidthPercentage(context, percentage: 0.0375)),
          tooltip: 'profile page',
          color: Colors.transparent,
          iconSize: screenWidthPercentage(context, percentage: 0.1),
          // onPressed: () => Navigator.pop(context),
          onPressed: () => Navigator.pushNamed(context, '/userset'),
/*           icon: CircleAvatar(
            foregroundImage: NetworkImage(UserPreferences.myUser.imagePath),
            // backgroundImage: NetworkImage(),
             backgroundColor: Colors.transparent,
            radius: screenHeightPercentage(context,percentage: 0.5),
          ),*/
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            // backgroundImage: NetworkImage(UserPreferences.myUser.imagePath),
            child: Image.network(
              // 'https://pbs.twimg.com/media/FHfttxDWQAAJQNK?format=jpg&name=large',
              UserPreferences.myUser.imagePath,
              // semanticLabel: 'Profile Picture',
              height: screenHeightPercentage(context, percentage: 0.1)/screenWidthPercentage(context, percentage: 0.1)*20,
              width: screenHeightPercentage(context, percentage: 0.1)/screenWidthPercentage(context, percentage: 0.1)*20,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
                  ? child
                  : const CircularProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    ),
            ),
          ),
        ),
/*        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(
              screenWidthPercentage(context, percentage: 0.15),
              screenHeightPercentage(context, percentage: 1),
            ),
            padding: EdgeInsets.only(right: screenWidthPercentage(context,percentage: 0.01)),
            elevation: 0.0,
            primary: Colors.amber,
          ),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            // Navigator.pushNamed(context, '/home');
          },
          child: CircleAvatar(
            child: Image.network(
              'https://pbs.twimg.com/media/FHfttxDWQAAJQNK?format=jpg&name=large',
              // color: Color(0xBE385C89),
              color: Colors.black38,
              loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
                  ? child
                  : const CircularProgressIndicator(
                      color: Colors.black,
                      // backgroundColor: Colors.transparent,
                    ),
              //semanticLabel: 'go without sign',
            ),
          ),
        ),*/
      ],
    );
  }
}
