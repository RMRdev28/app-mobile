class Register {
  final String first_name;
  final String phone;
  final String password;
  final String email;
  final String typeUser;
  final String file;

  Register({
    required this.first_name,
    required this.phone,
    required this.password,
    required this.email,
    required this.typeUser,
    required this.file,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": first_name,
      "phone": phone,
      "password": password,
      "email": email,
      "typeUser": typeUser,
      "file": file,
    };
  }
}
