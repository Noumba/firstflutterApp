
class Photo {
  String photoName;

  Photo(this.photoName);

  factory Photo.fromMap(Map<String, dynamic> data) {
    return Photo(
      data['photoName'],
    );
  }

  Map<String, dynamic> toMap() => {
    'photoName': photoName,
  };
}