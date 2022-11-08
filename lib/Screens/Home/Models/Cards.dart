// ignore_for_file: non_constant_identifier_names, file_names
class Cards {
  Cards({this.id, this.id_matter, this.question, this.answer});

  int? id;
  int? id_matter;
  String? question;
  String? answer;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'id_matter': id_matter,
      'question': question,
      'answer': answer
    };
    return map;
  }

  Cards.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    id_matter = map['id_matter'];
    question = map['question'];
    answer = map['answer'];
  }
}
