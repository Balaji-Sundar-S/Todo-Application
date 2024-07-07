import 'package:todo_application/features/auth/domain/entities/auth.entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({super.uid, super.email, super.displayName});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      uid: json['uid'],
      email: json['email'],
      displayName: json['displayName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['displayName'] = displayName;

    return data;
  }
}
