// ignore_for_file: non_constant_identifier_names, file_names
import 'package:vexa_flashcards/Screens/Home/Models/Cards.dart';

class Matter {
  Matter({this.id, this.icon, this.title, this.color, this.memory});

  int? id;
  String? icon;
  String? title;
  String? color;
  int? memory;
  List<Cards>? listCards;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'icon': icon,
      'title': title,
      'color': color,
      'memory': memory,
      
    };
    return map;
  }

  Matter.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    icon = map['icon'];
    title = map['title'];
    color = map['color'];
    memory = map['memory'];
  }
}
