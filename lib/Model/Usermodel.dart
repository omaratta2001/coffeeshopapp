class Usermodel {
  int id;
  final String firstname;
  final String Lastname;
  final String Email;
  final String Password;
  final String Address;
  final String phone;
  final String Gender;

  Usermodel(
      {this.id = 0,
      required this.firstname,
      required this.Lastname,
      required this.Email,
      required this.Password,
      required this.Address,
      required this.phone,
      required this.Gender});

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      id: json['userid'],
      firstname: json['firstName'],
      Lastname: json['lastName'],
      Email: json['email'],
      Password: json['password'],
      Address: json['address'],
      phone: json['phone'],
      Gender: json['gender'],
    );
  }
}
