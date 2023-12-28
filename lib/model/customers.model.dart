class CustomerModel {
  String? id;
  String? docId;
  String? email;
  String? password;

  CustomerModel({
    this.id,
    this.docId,
    this.email,
    this.password,
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data["password"] = password;
    return data;
  }
}
