// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserList {
  final String? userId;
  final String? fullName;
  final String? avatarUrl;

  UserList({
    required this.userId,
    required this.fullName,
    required this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'fullName': fullName,
      'avatarUrl': avatarUrl,
    };
  }

  factory UserList.fromMap(Map<String, dynamic> map) {
    return UserList(
      userId: map['userId'] as String?,
      fullName: map['fullName'] as String?,
      avatarUrl: map['avatarUrl'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserList.fromJson(String source) =>
      UserList.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<UserList> userList = [
  UserList(
    userId: "U_1",
    fullName: "Evelyn Rose",
    avatarUrl: "assets/images/users/u1.jpg",
  ),
  UserList(
      userId: "U_2",
      fullName: "Alexander Thompson",
      avatarUrl: "assets/images/users/u2.jpg"),
  UserList(
      userId: "U_3",
      fullName: "Maya Patel",
      avatarUrl: "assets/images/users/u3.jpg"),
  UserList(
      userId: "U_4",
      fullName: "Liam Lee",
      avatarUrl: "assets/images/users/u4.jpg"),
  UserList(
      userId: "U_5",
      fullName: "Sophia Garcia",
      avatarUrl: "assets/images/users/u5.jpg"),
  UserList(
      userId: "U_6",
      fullName: "Noah Hernandez",
      avatarUrl: "assets/images/users/u6.jpg"),
  UserList(
      userId: "U_7",
      fullName: "Aisha Khan",
      avatarUrl: "assets/images/users/u7.jpg"),
  UserList(
      userId: "U_8",
      fullName: "Elijah Wright",
      avatarUrl: "assets/images/users/u8.jpg"),
  UserList(
      userId: "U_9",
      fullName: "Claire Dubois",
      avatarUrl: "assets/images/users/u9.jpg"),
  UserList(
    userId: "U_10",
    fullName: "William Garcia",
    avatarUrl: "assets/images/users/u10.jpg",
  ),
  UserList(
    userId: "U_11",
    fullName: "Amelia Johnson",
    avatarUrl: "assets/images/users/u11.jpg",
  ),
  UserList(
    userId: "U_12",
    fullName: "Benjamin Kim",
    avatarUrl: "assets/images/users/u12.jpg",
  ),
  UserList(
    userId: "U_13",
    fullName: "Natalia Lopez",
    avatarUrl: "assets/images/users/u13.jpg",
  ),
  UserList(
    userId: "U_14",
    fullName: "Lucas Baker",
    avatarUrl: "assets/images/users/u14.jpg",
  ),
  UserList(
    userId: "U_15",
    fullName: "Chloe Kim",
    avatarUrl: "assets/images/users/u15.jpg",
  ),
  UserList(
    userId: "U_16",
    fullName: "Daniel Nguyen",
    avatarUrl: "assets/images/users/u16.jpg",
  ),
  UserList(
    userId: "U_17",
    fullName: "Anna Petrova",
    avatarUrl: "assets/images/users/u17.jpg",
  ),
  UserList(
    userId: "U_18",
    fullName: "Mason Robinson",
    avatarUrl: "assets/images/users/u18.jpg",
  ),
  UserList(
    userId: "U_19",
    fullName: "Sarah Miller",
    avatarUrl: "assets/images/users/u19.jpg",
  ),
  UserList(
    userId: "U_20",
    fullName: "Ethan Patel",
    avatarUrl: "assets/images/users/u20.jpg",
  ),
];
