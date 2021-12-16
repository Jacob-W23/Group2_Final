class Movies {
  final String id;
  final String moviePoster;
  final String movieName;
  final String movieDescription;

  Movies._(this.id, this.moviePoster, this.movieName, this.movieDescription);

  factory Movies.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final moviePoster = json['moviePoster'];
    final movieName = json['movieName'];
    final movieDescription = json['movieDescription'];

    return Movies._(id, moviePoster, movieName, movieDescription);
  }
}
