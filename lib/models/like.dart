class Liked {
  String? receiverId;
  String? senderId;
  bool? liked;

  Liked({required this.liked, required this.receiverId, required this.senderId});

  Liked.fromMap(Map<String, dynamic> map) {
    liked = map['liked-back'];
    senderId = map['senderId'];
    receiverId = map['receiverId'];
  }
}

class Waved {
  String? receiverId;
  String? senderId;
  bool? waved;

  Waved({required this.waved, required this.receiverId, required this.senderId});

  Waved.fromMap(Map<String, dynamic> map) {
    waved = map['waved-back'];
    senderId = map['senderId'];
    receiverId = map['receiverId'];
  }
}
