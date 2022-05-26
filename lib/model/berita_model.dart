class News {
  String? judul;
  String? desk;
  String? img;
  String? sumber;
  DateTime? createdAt;

  News({
    required this.judul,
    required this.desk,
    required this.img,
    required this.sumber,
    required this.createdAt,
  });

  factory News.fromJson(Map<String, dynamic> map) {
    return News(
      judul: map['judul'],
      desk: map['desk'],
      img: map['img'],
      sumber: map['sumber'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}
