import 'PersonagemThumbDTO.dart';

class PersonagemDTO {
  int id;
  String name;
  String description;
  PersonagemThumbDTO thumbnail;

  PersonagemDTO.map(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.description = json['description'];
    if (json['description'] != null)
      this.thumbnail = PersonagemThumbDTO.map(json['thumbnail']);
  }
}
