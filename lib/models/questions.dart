class QuestionsData {
  String? id;
  String? questions;
  String? description;

  QuestionsData({required this.description, required this.id, required this.questions});

  QuestionsData.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    questions = map['questions'];
    description = map['description'];
  }
}
