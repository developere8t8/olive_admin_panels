class DailyDish {
  String? date;
  String? dish1;
  String? dish1Image;
  List? dish1Voters;
  String? dish2;
  String? dish2Image;
  List? dish2Voters;
  double? dish2Votes;
  double? totalVotes;
  double? dish1Votes;
  var dishVotes;

  DailyDish({
    required this.date,
    required this.dish1,
    required this.dish1Image,
    required this.dish1Voters,
    required this.dish1Votes,
    required this.dish2,
    required this.dish2Image,
    required this.dish2Voters,
    required this.dish2Votes,
    required this.dishVotes,
    required this.totalVotes,
  });

  DailyDish.fromMap(Map<String, dynamic> map) {
    date = map['date'];
    dish1 = map['dish-one'];
    dish1Image = map['dish-one-image'];
    dish1Voters = map['dish-one-voters'];
    dish1Votes = double.parse(map['dish-one-votes'].toString());
    dish2 = map['dish-two'];
    dish2Image = map['dish-two-image'];
    dish2Voters = map['dish-two-voters'];
    dish2Votes = double.parse(map['dish-two-votes'].toString());
    totalVotes = double.parse(map['total-votes'].toString());
    dish1Voters = map['voters'];
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'dish-one': dish1,
      'dish-one-image': dish1Image,
      'dish-one-voters': dish1Voters,
      'dish-one-votes': dish1Votes,
      'dish-two': dish2,
      'dish-two-image': dish2Image,
      'dish-two-voters': dish2Voters,
      'dish-two-votes': dish2Votes,
      'total-votes': totalVotes,
      'voters': dishVotes
    };
  }
}
