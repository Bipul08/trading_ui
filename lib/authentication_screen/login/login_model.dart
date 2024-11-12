

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? status;
  String? message;
  String? token;
  Data? data;

  LoginModel({
    this.status,
    this.message,
    this.token,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? customerId;
  String? name;
  String? status;
  String? email;
  String? phone;
  dynamic gender;
  String? referralCode;
  dynamic dob;
  dynamic profile;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.customerId,
    this.name,
    this.status,
    this.email,
    this.phone,
    this.gender,
    this.referralCode,
    this.dob,
    this.profile,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    customerId: json["customer_id"],
    name: json["name"],
    status: json["status"],
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
    referralCode: json["referral_code"],
    dob: json["dob"],
    profile: json["profile"],
    password: json["password"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "name": name,
    "status": status,
    "email": email,
    "phone": phone,
    "gender": gender,
    "referral_code": referralCode,
    "dob": dob,
    "profile": profile,
    "password": password,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
