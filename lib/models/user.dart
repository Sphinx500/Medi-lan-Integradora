class User {
  final String id;
  final String fullName;
  final String lastName;
  final String lastName2;

  final String email;
  final String userRole;

  User({this.id, this.fullName, this.lastName, this.lastName2, this.email, this.userRole});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        lastName = data['lastName'],
        lastName2 = data['lastName2'],
        email = data['email'],
        userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'lastName': lastName,
      'lastName2': lastName2,
      'email': email,
      'userRole': userRole,
    };
  }
}