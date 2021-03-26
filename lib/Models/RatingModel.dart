
class Rating{
  final int stars;
  final int uid;
  final int pid;

  Rating( this.stars, this.uid, this.pid);

  factory Rating.fromMap(Map<String, dynamic> data) {
    return Rating(
      data['stars'],
      data['uid'],
      data['pid'],
    );
  }

  Map<String, dynamic> toMap() => {
    'stars': stars,
    'uid': uid,
    'pid': pid,
  };
}