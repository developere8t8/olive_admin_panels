class SwipeData {
  String? id;
  double? count;

  SwipeData({required this.count, required this.id});

  SwipeData.fromMap(Map<String, dynamic> map) {
    count = double.parse(map['count'].toString());
    id = map['id'];
  }

  Map<String, dynamic> toMap() {
    return {'count': count, 'id': id};
  }
}
