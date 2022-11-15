// To parse this JSON data, do
//
//     final userLocalApiTodo = userLocalApiTodoFromJson(jsonString);

import 'dart:convert';

List<UserLocalApiTodo> userLocalApiTodoFromJson(String str) => List<UserLocalApiTodo>.from(json.decode(str).map((x) => UserLocalApiTodo.fromJson(x)));

String userLocalApiTodoToJson(List<UserLocalApiTodo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLocalApiTodo {
  UserLocalApiTodo({
    required this.name,
    required this.lastName,
     this.id,
    required this.gender,
    required this.email,
    required this.address,
  });

  String name;
  String lastName;
  int? id;
  String gender;
  String email;
  Address address;

  factory UserLocalApiTodo.fromJson(Map<String, dynamic> json) => UserLocalApiTodo(
    name: json["name"],
    lastName: json["last_name"],
    id: json["id"],
    gender: json["gender"],
    email: json["email"],
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "last_name": lastName,
    "id": id,
    "gender": gender,
    "email": email,
    "address": address.toJson(),
  };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  String street;
  String suite;
  String city;
  String zipcode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"],
    suite: json["suite"],
    city: json["city"],
    zipcode: json["zipcode"],
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode,
  };
}


