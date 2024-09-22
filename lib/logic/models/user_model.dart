class ChatUser {
  final String? name, email, id, image, about, createdAt, lastActive, pushToken;
  final bool? isOnline;

  ChatUser({
    required this.name,
    required this.email,
    required this.id,
    required this.image,
    required this.about,
    required this.createdAt,
    required this.lastActive,
    required this.pushToken,
    required this.isOnline,
  });
  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      name: json['name'],
      email: json['email'],
      id: json['id'] ?? '',
      image: json['image'],
      about: json['about'],
      createdAt: json['createdAt'],
      lastActive: json['last_active'],
      pushToken: json['push_token'],
      isOnline: json['is_online'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'image': image,
      'about': about,
      'created_at': createdAt,
      'last_active': lastActive,
      'push_token': pushToken,
      'is_online': isOnline
    };
  }
}
