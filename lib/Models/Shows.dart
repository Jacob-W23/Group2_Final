class Shows {
  final String id;
  final String showName;
  final String showDescription;

  Shows._(this.id,this.showName,this.showDescription);

  factory Shows.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final showName = json['showName'];
    final showDescription = json['courseCredits'];

    return Shows._(id,showName,showDescription);
  }
}