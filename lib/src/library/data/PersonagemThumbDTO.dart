class PersonagemThumbDTO {
  String path;
  String extension;

  PersonagemThumbDTO.map(Map<String, dynamic> json) {
    this.path = json['path'];
    this.extension = json['extension'];
  }

  String get imageUrl {
    return '$path.$extension';
  }
}
