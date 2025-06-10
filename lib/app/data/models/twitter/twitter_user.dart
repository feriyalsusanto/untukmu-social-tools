class TwitterUser {
  final int id;
  final String? email;
  final String? thumbnailImage;
  final String? name;
  final String? screenName;

  TwitterUser({
    required this.id,
    this.email,
    this.thumbnailImage,
    this.name,
    this.screenName,
  });

  factory TwitterUser.fromJson(Map<String, dynamic> json) {
    return TwitterUser(
      id: json['id'],
      email: json['email'],
      thumbnailImage: json['thumbnailImage'],
      name: json['name'],
      screenName: json['screenName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'thumbnailImage': thumbnailImage,
      'name': name,
      'screenName': screenName,
    };
  }

  @override
  String toString() {
    return 'TwitterUser(id: $id, email: $email, thumbnailImage: $thumbnailImage, name: $name, screenName: $screenName)';
  }
}
