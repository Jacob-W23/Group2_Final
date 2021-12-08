class Movies {
  final String id;
  final String movieName;
  final String movieDescription;

  Movies._(this.id,this.movieName,this.movieDescription);

  factory Movies.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final movieName = json['movieName'];
    final movieDescription = json['movieDescription'];

    return Movies._(id,movieName,movieDescription);
  }
}