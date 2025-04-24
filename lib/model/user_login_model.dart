class UserLoginModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? role;
  String? createdAt;

  UserLoginModel(
      {this.id, this.name, this.email, this.phone, this.role, this.createdAt});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['role'] = role;
    data['created_at'] = createdAt;
    return data;
  }
}
