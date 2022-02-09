import 'package:capstone/utilities/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchBarController = TextEditingController();

  String regexToRemoveEmoji = r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.indigoAccent,
      height: screenHeightPercentage(context, percentage: 0.045),
      width: screenWidthPercentage(context, percentage: 0.65),
      // margin: const EdgeInsets.fromLTRB(0, 19.25, 0, 0),
      // decoration: kBoxDecorationStyle,
      // padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: TextFormField(
        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(regexToRemoveEmoji))],
        keyboardType: TextInputType.text,
        controller: _searchBarController,
        cursorColor: Colors.black12,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        // controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
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
            // onPressed: () => print('closed'),
            onPressed: () => _searchBarController.clear(),
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
    );
  }
}
