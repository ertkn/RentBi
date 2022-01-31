class User {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String imagePath;

  String? about;
  String? address;
  String? addressDistrict;
  String? addressCity;
  String? addressCountry;
  int? phoneNumber;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    required this.imagePath,
    this.about,
    this.address,
    this.addressDistrict,
    this.addressCity,
    this.addressCountry,
    this.phoneNumber,
  });
}
