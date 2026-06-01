class UserModel {
  final String id;
  final String name;
  final String username;
  final String email;
  final String? phone;
  final String token;

  const UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.phone,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      final data = json['data'] ?? json['user'] ?? json;
      return UserModel(
        id:       (data['_id']   ?? data['id']    ?? '').toString(),
        name:     (data['name']  ?? '').toString(),
        username: (data['username'] ?? data['userName'] ?? '').toString(),
        email:    (data['email'] ?? '').toString(),
        phone:    data['phone']?.toString(),
        token:    (json['token'] ?? data['token'] ?? '').toString(),
      );
    } catch (e) {
      return const UserModel(id: '', name: '', username: '', email: '', token: '');
    }
  }
}