class AdminData {
  String? email;
  String? id;
  String? name;
  String? password;
  String? status;

  AdminData(
      {required this.email,
      required this.id,
      required this.name,
      required this.password,
      required this.status});
  AdminData.fromMap(Map<String, dynamic> map) {
    email = map['email'];
    id = map['id'];
    name = map['name'];
    password = map['password'];
    status = map['status'];
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'id': id, 'name': name, 'password': password, 'status': status};
  }
}
