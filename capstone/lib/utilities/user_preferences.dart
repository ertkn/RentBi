import 'package:capstone/models/user.dart';

class UserPreferences {
  static User myUser = User(
    firstName: 'Ertekin',
    lastName: 'Özçelik',
    email: 'ert@gmail.com',
    password: '124235',
    // imagePath: 'capstone/assets/anato_finnstark.jpg',
    imagePath: 'https://pbs.twimg.com/media/FHfttxDWQAAJQNK?format=jpg&name=large',
/*      about: 'dev',
      address: 'istanbul/pendik',
      addressDistrict: 'pendik',
      addressCity: 'istanbul',
      addressCountry: 'türkiye',
      phoneNumber: 01243265,*/
  );

  static User newUser = User(
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    imagePath: '',
/*      about: 'dev',
      address: 'istanbul/pendik',
      addressDistrict: 'pendik',
      addressCity: 'istanbul',
      addressCountry: 'türkiye',
      phoneNumber: 01243265,*/
  );
}
