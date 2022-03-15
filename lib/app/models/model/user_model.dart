import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:bibliopolium/app/models/model/comunity_model.dart';

class UserModel {
  static const String collection = 'user';

  final String id;
  final String uid;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final List<String> level;
  final String? cellPhone;
  final String? address;
  final String? cep;
  final List<CommunityRef> communityRefList;
  final DateTime createdAt;
  final bool isActive;
  UserModel({
    required this.id,
    required this.uid,
    required this.email,
    this.displayName,
    this.photoUrl,
    required this.level,
    this.cellPhone,
    this.address,
    this.cep,
    required this.communityRefList,
    required this.createdAt,
    required this.isActive,
  });

  UserModel copyWith({
    String? id,
    String? uid,
    String? email,
    String? displayName,
    String? photoUrl,
    List<String>? level,
    String? cellPhone,
    String? address,
    String? cep,
    List<CommunityRef>? communityRefList,
    DateTime? createdAt,
    bool? isActive,
  }) {
    return UserModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      level: level ?? this.level,
      cellPhone: cellPhone ?? this.cellPhone,
      address: address ?? this.address,
      cep: cep ?? this.cep,
      communityRefList: communityRefList ?? this.communityRefList,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'level': level,
      'cellPhone': cellPhone,
      'address': address,
      'cep': cep,
      'communityRefList': communityRefList.map((x) => x.toMap()).toList(),
      'createdAt': createdAt,
      'isActive': isActive,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'],
      photoUrl: map['photoUrl'],
      level: List<String>.from(map['level']),
      cellPhone: map['cellPhone'],
      address: map['address'],
      cep: map['cep'],
      communityRefList: List<CommunityRef>.from(
          map['communityRefList']?.map((x) => CommunityRef.fromMap(x))),
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          map['createdAt']?.millisecondsSinceEpoch ??
              DateTime.now().millisecondsSinceEpoch),
      isActive: map['isActive'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl, level: $level, cellPhone: $cellPhone, address: $address, cep: $cep, communityRefList: $communityRefList, createdAt: $createdAt, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.uid == uid &&
        other.email == email &&
        other.displayName == displayName &&
        other.photoUrl == photoUrl &&
        listEquals(other.level, level) &&
        other.cellPhone == cellPhone &&
        other.address == address &&
        other.cep == cep &&
        listEquals(other.communityRefList, communityRefList) &&
        other.createdAt == createdAt &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uid.hashCode ^
        email.hashCode ^
        displayName.hashCode ^
        photoUrl.hashCode ^
        level.hashCode ^
        cellPhone.hashCode ^
        address.hashCode ^
        cep.hashCode ^
        communityRefList.hashCode ^
        createdAt.hashCode ^
        isActive.hashCode;
  }
}

class UserRef {
  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;
  UserRef({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
  });

  UserRef copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoUrl,
  }) {
    return UserRef(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
    };
  }

  factory UserRef.fromMap(Map<String, dynamic> map) {
    return UserRef(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRef.fromJson(String source) =>
      UserRef.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserRef(id: $id, email: $email, displayName: $displayName, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserRef &&
        other.id == id &&
        other.email == email &&
        other.displayName == displayName &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        displayName.hashCode ^
        photoUrl.hashCode;
  }
}
