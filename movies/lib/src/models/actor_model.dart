class Cast {
  List<Actor> actors = new List();
  Cast.fromJSONList(List<dynamic> jsonCast) {
    if (jsonCast == null) return;
    jsonCast.forEach((jsonActor) => actors.add(Actor.fromJSON(jsonActor)));
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJSON(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }
  getProfileImg() {
    return (profilePath == null)
        ? 'https://sainfoinc.com/wp-content/uploads/2018/02/image-not-available.jpg'
        : 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}
