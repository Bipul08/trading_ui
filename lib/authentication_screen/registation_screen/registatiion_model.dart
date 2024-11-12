
import 'dart:convert';

RegistationModel registationModelFromJson(String str) => RegistationModel.fromJson(json.decode(str));

String registationModelToJson(RegistationModel data) => json.encode(data.toJson());

class RegistationModel {
  bool? status;
  String? message;
  Data? data;

  RegistationModel({
    this.status,
    this.message,
    this.data,
  });

  factory RegistationModel.fromJson(Map<String, dynamic> json) => RegistationModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? customerId;
  String? referralCode;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.customerId,
    this.referralCode,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    customerId: json["customer_id"],
    referralCode: json["referral_code"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "customer_id": customerId,
    "referral_code": referralCode,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
