// import 'dart:convert';
class User {
  final int id;
  final String first_name;
  final String? last_name;
  final String email;
  final DateTime? email_verified_at;
  final String phone;
  final String type;
  final String? remember_token;
  final DateTime created_at;
  final DateTime? deleted_at;
  final DateTime? updated_at;
  final String? address;
  final String picture;
  final int status;
  final int? shipping_id;
  final int account;
  final String slug;
  final String? commune_id;
  final String? registerCommerce;
  final String? token;

  User(
      {required this.first_name,
      this.last_name,
      required this.id,
      required this.email,
      required this.picture,
      required this.account,
      this.address,
      this.email_verified_at,
      required this.phone,
      required this.type,
      required this.status,
      required this.slug,
      this.remember_token,
      this.registerCommerce,
      this.commune_id,
      this.shipping_id,
      this.deleted_at,
      required this.created_at,
      this.updated_at,
      this.token});

  Map<String, dynamic> toJson() {
    return {
      "first_name": first_name,
      "last_name": last_name,
      "id": id,
      "email": email,
      "picture": picture,
      "account": account,
      "address": address,
      "email_verified_at": email_verified_at?.toIso8601String(),
      "phone": phone,
      "type": type,
      "status": status,
      "slug": slug,
      "remember_token": remember_token,
      "registerCommerce": registerCommerce,
      "commune_id": commune_id,
      "shipping_id": shipping_id,
      "deleted_at": deleted_at?.toIso8601String(),
      "created_at": created_at.toIso8601String(),
      "updated_at": updated_at?.toIso8601String(),
      "token": token
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      first_name: json['first_name'],
      last_name: json['last_name'] as String?,
      id: json['id'],
      email: json['email'],
      email_verified_at: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      phone: json['phone'],
      type: json['type'],
      status: json['status'],
      deleted_at: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      created_at: DateTime.parse(json['created_at']),
      updated_at: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      slug: json['slug'],
      remember_token: json['remember_token'] as String?,
      token: json['remember_token'] as String?,
      address: json['address'] as String?,
      account: json['account'],
      picture: json['picture'],
      shipping_id: json['shipping_id'] as int?,
      commune_id: json['commune_id'] as String?,
      registerCommerce: json['registerCommerce'] as String?,
    );
  }
}
