// ignore_for_file: non_constant_identifier_names, file_names
class Matter {
  Matter({this.id, this.icon, this.title, this.color});

  int? id;
  String? icon;
  String? title;
  String? color;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'icon': icon,
      'title': title,
      'color': color
    };
    return map;
  }

  Matter.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    icon = map['icon'];
    title = map['title'];
    color = map['color'];
  }
}
