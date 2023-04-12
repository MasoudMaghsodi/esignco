class Banner {
  String? title;
  String? imageSmall;
  int? id;

  Banner(this.id, this.imageSmall, this.title);

  factory Banner.fromJson(Map<String, dynamic> jsonObject) {
    return Banner(
      jsonObject['id'],
      jsonObject['imageSmall'],
      jsonObject['title'],
    );
  }
}
