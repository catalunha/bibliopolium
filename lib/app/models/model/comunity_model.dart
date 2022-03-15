import 'dart:convert';

import 'package:bibliopolium/app/models/model/user_model.dart';

class CommunityModel {
  static const String collection = 'community';

  final String id;
  final String name;
  final String state;
  final String city;
  final String? email;
  final UserRef? coordinator;
  final String? codeCC;
  final String? description;
  final bool isActive;
  CommunityModel({
    required this.id,
    required this.name,
    required this.state,
    required this.city,
    this.email,
    this.coordinator,
    this.codeCC,
    this.description,
    required this.isActive,
  });

  CommunityModel copyWith({
    String? id,
    String? name,
    String? state,
    String? city,
    String? email,
    UserRef? coordinator,
    String? codeCC,
    String? description,
    bool? isActive,
  }) {
    return CommunityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
      city: city ?? this.city,
      email: email ?? this.email,
      coordinator: coordinator ?? this.coordinator,
      codeCC: codeCC ?? this.codeCC,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'state': state,
      'city': city,
      'email': email,
      'coordinator': coordinator?.toMap(),
      'codeCC': codeCC,
      'description': description,
      'isActive': isActive,
    };
  }

  factory CommunityModel.fromMap(Map<String, dynamic> map) {
    return CommunityModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      state: map['state'] ?? '',
      city: map['city'] ?? '',
      email: map['email'],
      coordinator: map['coordinator'] != null
          ? UserRef.fromMap(map['coordinator'])
          : null,
      codeCC: map['codeCC'],
      description: map['description'],
      isActive: map['isActive'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommunityModel.fromJson(String source) =>
      CommunityModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Community(id: $id, name: $name, state: $state, city: $city, email: $email, coordinator: $coordinator, codeCC: $codeCC, description: $description, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommunityModel &&
        other.id == id &&
        other.name == name &&
        other.state == state &&
        other.city == city &&
        other.email == email &&
        other.coordinator == coordinator &&
        other.codeCC == codeCC &&
        other.description == description &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        state.hashCode ^
        city.hashCode ^
        email.hashCode ^
        coordinator.hashCode ^
        codeCC.hashCode ^
        description.hashCode ^
        isActive.hashCode;
  }
}

class CommunityRef {
  final String id;
  final String name;
  final String state;
  final String city;
  CommunityRef({
    required this.id,
    required this.name,
    required this.state,
    required this.city,
  });

  CommunityRef copyWith({
    String? id,
    String? name,
    String? state,
    String? city,
  }) {
    return CommunityRef(
      id: id ?? this.id,
      name: name ?? this.name,
      state: state ?? this.state,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'state': state,
      'city': city,
    };
  }

  factory CommunityRef.fromMap(Map<String, dynamic> map) {
    return CommunityRef(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      state: map['state'] ?? '',
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommunityRef.fromJson(String source) =>
      CommunityRef.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommunityRef(id: $id, name: $name, state: $state, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommunityRef &&
        other.id == id &&
        other.name == name &&
        other.state == state &&
        other.city == city;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ state.hashCode ^ city.hashCode;
  }
}
