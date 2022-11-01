class SubscriptionData {
  bool? enable;
  String? id;

  SubscriptionData({required this.enable, required this.id});

  SubscriptionData.fromMap(Map<String, dynamic> map) {
    enable = map['enabled'];
    id = map['id'];
  }
}
