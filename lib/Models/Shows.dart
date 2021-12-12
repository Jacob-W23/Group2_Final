class Shows {
  final String id;
    final String showPoster;
  final String showName;
  final String showDescription;

  Shows._(this.id,this.showPoster,this.showName,this.showDescription);

  factory Shows.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final showPoster = json['showPoster'];
    final showName = json['showName'];
    final showDescription = json['showDescription'];

    return Shows._(id,showPoster,showName,showDescription);
  }
}