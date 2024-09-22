class RoomModel {
  final String? id, createdAt, lastMessage, lastMessageTime;
  final List? members;

  RoomModel({
    required this.members,
    required this.id,
    required this.createdAt,
    required this.lastMessage,
    required this.lastMessageTime,
  });
  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['id'] ?? '',
      createdAt: json['createdAt'],
      lastMessage: json['last_Message'] ?? '',
      members: json['members'] ?? [],
      lastMessageTime: json['last_Message_time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'last_Message': lastMessage,
      'members': members,
      'last_Message_time': lastMessageTime
    };
  }
}
