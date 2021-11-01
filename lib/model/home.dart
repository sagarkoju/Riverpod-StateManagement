class DataModel {
  int userId, id;
  String title, body;

  DataModel({
    this.userId,
    this.body,
    this.id,
    this.title,
  });
  factory DataModel.fromMap(Map<String, dynamic> map) {
    return new DataModel(
      id: map['id'] as int,
      userId: map['userId'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'userId': this.userId,
      'title': this.title,
      'body': this.body,
    } as Map<String, dynamic>;
  }

}
