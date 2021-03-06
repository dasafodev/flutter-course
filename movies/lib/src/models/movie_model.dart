class Movies {
  List<Movie> list = new List();

  Movies();

  Movies.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      final movie = new Movie.fromJsonMap(item);
      list.add(movie);
    });
  }
}

class Movie {
  String uniqueId;

  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Movie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.releaseDate,
    this.overview,
    this.voteAverage
  });

  Movie.fromJsonMap(Map<String, dynamic> json) {
    popularity = json['popularity'] / 1;
    voteCount = json['vote_count'];
    video = json['video'];
    posterPath = json['poster_path'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    title = json['title'];
    genreIds = json['genre_ids'].cast<int>();
    releaseDate = json['release_date'];
    overview = json['overview'];
    voteAverage = json['vote_average']/1;
  }

  getPosterImg() {
    return (posterPath == null)
        ? 'https://sainfoinc.com/wp-content/uploads/2018/02/image-not-available.jpg'
        : 'https://image.tmdb.org/t/p/w500/$posterPath';
  }
  getBackgroundImg() {
    return (backdropPath == null)
        ? 'https://sainfoinc.com/wp-content/uploads/2018/02/image-not-available.jpg'
        : 'https://image.tmdb.org/t/p/w500/$backdropPath';
  }
}
