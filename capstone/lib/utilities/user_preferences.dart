import 'package:capstone/models/user.dart';

class UserPreferences {
  static User myUser = User(
    firstName: 'Ertekin',
    lastName: 'Özçelik',
    email: 'ert@gmail.com',
    password: '124235',
    // imagePath: 'capstone/assets/anato_finnstark.jpg',
    imagePath: 'https://pbs.twimg.com/media/FHfttxDWQAAJQNK?format=jpg&name=large',
    // about: 'dev',
    about:
    'Integer id dignissim sem. Praesent hendrerit enim nisl, consequat bibendum lorem tempor vitae.'
        ' In finibus augue eget laoreet scelerisque. Nunc accumsan lacinia nibh quis mattis.'
        ' Aliquam in nisi risus. Fusce dignissim ligula ac augue tristique congue. Mauris congue rutrum ligula,'
        ' quis euismod elit mattis non.',
    address: 'istanbul/pendik',
    addressDistrict: 'pendik',
    addressCity: 'istanbul',
    addressCountry: 'türkiye',
    phoneNumber: 05343400988,
  );

  static User newUser = User(
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    imagePath: 'https://pbs.twimg.com/media/FHfttxDWQAAJQNK?format=jpg&name=large',
    about: 'Integer id dignissim sem. Praesent hendrerit enim nisl, consequat bibendum lorem tempor vitae.'
        ' In finibus augue eget laoreet scelerisque. Nunc accumsan lacinia nibh quis mattis.'
        ' Aliquam in nisi risus. Fusce dignissim ligula ac augue tristique congue. Mauris congue rutrum ligula,'
        ' quis euismod elit mattis non.',
    address: '',
    addressDistrict: '',
    addressCity: '',
    addressCountry: '',
    phoneNumber: null,
  );
}
